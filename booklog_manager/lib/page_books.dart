import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:booklog_manager/database_manager.dart';
import 'package:booklog_manager/isar/book.dart';
import 'package:booklog_manager/settings_manager.dart';
import 'package:booklog_manager/url_launcher.dart';

class PageBooks extends StatefulWidget {
  var searchText = '';
  var controller = TextEditingController();

  @override
  State<PageBooks> createState() => _PageBooksState();
}

class _PageBooksState extends State<PageBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _searchBar(),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => _refreshDatabaseAsync(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _refreshDatabaseAsync();
        },
        child: ListView(
          cacheExtent: 0.0,
          children: [
            for (var book in DatabaseManager().books)
              if (widget.searchText == '' || book.title.contains(widget.searchText)) _listViewItem(book),
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    return SizedBox(
      height: 42,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Container(
            child: TextField(
              controller: widget.controller,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: 'タイトル検索',
                hintStyle: TextStyle(color: Colors.grey.shade300),
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      widget.controller.clear();
                      widget.searchText = '';
                    });
                  },
                  icon: Icon(Icons.clear),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                isDense: true,
              ),
              onChanged: (text) {
                setState(() {
                  widget.searchText = text;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _listViewItem(Book book) {
    return Container(
      decoration: new BoxDecoration(
        border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
      ),
      child: ListTile(
        leading: SettingsManager().isDisplayImage ?
          CachedNetworkImage(
            imageUrl: book.image,
            progressIndicatorBuilder: (context, url, downloadProgress) => 
            CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Image.asset('images/noimage.png'),
          ) :
          Image.asset('images/noimage.png'),
        title: Text(
          book.title,
          style: TextStyle(
            color:Colors.black,
            fontSize: 14.0
          ),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(book.catalog),
        onTap: () {
          UrlLauncher.openUrl(book.url);
        },
      ),
    );
  }

  void _showProgressDialog() {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: Duration(milliseconds: 300),
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    );
  }

  Future<void> _refreshDatabaseAsync() async {
    _showProgressDialog();

    var isSuccess = true;

    try {
      var userId = SettingsManager().userId;
      var maxBookCount = SettingsManager().maxBookCount;
      var url = Uri.parse('http://api.booklog.jp/v2/json/$userId?count=$maxBookCount');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('response: ${response.body}');
        }

        Map<String, dynamic> responseJson = convert.jsonDecode(response.body);
        await DatabaseManager().addFromJsonAsync(responseJson);
      } else {
        isSuccess = false;
      }
    } catch (e) {
      isSuccess = false;
    } finally {
      setState(() {
        Navigator.of(context).pop();

        if (!isSuccess) {
          _dialogErrorAsync(context);
        }
      });
    }
  }

  Future<void> _dialogErrorAsync(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("エラー"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Column(
                  children: [
                    Text('データの取得に失敗しました'),
                    Text(''),
                    Text('ブクログIDや公開設定を確認してください'),
                    Text('詳しくはヘルプをご覧ください'),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
