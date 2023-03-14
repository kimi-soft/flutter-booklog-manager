import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:booklog_manager/url_launcher.dart';
import 'package:booklog_manager/database_manager.dart';
import 'package:booklog_manager/isar/book.dart';

class PageBooks extends StatefulWidget {
  @override
  State<PageBooks> createState() => _PageBooksState();
}

class _PageBooksState extends State<PageBooks> {
  var _searchText = '';
  var _controller = TextEditingController();

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
              controller: _controller,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: 'タイトル検索',
                hintStyle: TextStyle(color: Colors.grey.shade300),
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _controller.clear();
                      _searchText = '';
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
                  _searchText = text;
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
        leading: CachedNetworkImage(
          imageUrl: book.image,
          progressIndicatorBuilder: (context, url, downloadProgress) => 
          CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _searchBar(),
        actions: [
          IconButton(
            icon: Icon(Icons.sync),
            onPressed: () => _refreshDatabaseAsync(),
          ),
        ],
      ),
      body: ListView(
        cacheExtent: 0.0,
        children: [
          for (var book in DatabaseManager().books)
            if (_searchText == '' || book.title.contains(_searchText)) _listViewItem(book),
        ],
      ),
    );
  }

  void showProgressDialog() {
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
    showProgressDialog();

    try {
      var url = Uri.parse('http://api.booklog.jp/v2/json/2e2afb17c0ba25d2?count=10');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('response: ${response.body}');
        }

        Map<String, dynamic> responseJson = convert.jsonDecode(response.body);
        await DatabaseManager().addFromJsonAsync(responseJson);

        setState(() {
        });
      } else {
        print('error');
      }
    } finally {
      Navigator.of(context).pop();
    }
  }
}
