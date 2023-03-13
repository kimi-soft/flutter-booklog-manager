import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:booklog_manager/url_launcher.dart';

class PageBooks extends StatefulWidget {
  @override
  State<PageBooks> createState() => _PageBooksState();
}

class _PageBooksState extends State<PageBooks> {
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
                  onPressed: _controller.clear,
                  icon: Icon(Icons.clear),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                isDense: true,
              ),
              onSubmitted: (text) => {
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _listItem(Book book) {
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
          _listItem(Book(
              'https://booklog.jp/users/2e2afb17c0ba25d2/archives/1/B075K3Z175',
              'まもなく開演！(2) (電撃コミックスNEXT)',
              'https://m.media-amazon.com/images/I/51PHXP3HcBL._SL75_.jpg',
              'ebook',
            )
          ),
          _listItem(Book(
              'https://booklog.jp/users/2e2afb17c0ba25d2/archives/1/4048924281',
              'まもなく開演!(1) (電撃コミックスNEXT)',
              'https://m.media-amazon.com/images/I/51koLd5o9kL._SL75_.jpg',
              'comic',
            )
          ),
          _listItem(Book(
              'https://booklog.jp/users/2e2afb17c0ba25d2/archives/1/4866997680',
              '本好きの下剋上～司書になるためには手段を選んでいられません～第三部 「領地に本を広げよう！6」',
              'https://m.media-amazon.com/images/I/51TbyYkyMBL._SL75_.jpg',
              'comic',
            )
          ),
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
      var url = Uri.parse('http://api.booklog.jp/v2/json/2e2afb17c0ba25d2');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('response: ${response.body}');
        }

        Map<String, dynamic> responseJson = convert.jsonDecode(response.body);
        List<dynamic> books = List.from(responseJson['books']);
        books.forEach((jsonObj) {
            Book book = Book.fromJson(jsonObj);
        });
      } else {
        print('error');
      }
    } finally {
      Navigator.of(context).pop();
    }
  }
}

class Tana {
  final String account;
  final String name;
  final String imageUrl;

  Tana(this.account, this.name, this.imageUrl);

  Tana.fromJson(Map<String, dynamic> json)
    : account = json['account'],
      name = json['name'],
      imageUrl = json['image_url'];
}

class Book {
  final String url;
  final String title;
  final String image;
  final String catalog;

  Book(this.url, this.title, this.image, this.catalog);

  Book.fromJson(Map<String, dynamic> json)
    : url = json['url'],
      title = json['title'],
      image = json['image'],
      catalog = json['catalog'];
}
