import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PageBooks extends StatefulWidget {

  @override
  State<PageBooks> createState() => _PageBooksState();
}

class _PageBooksState extends State<PageBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.book),
        title: Text('本棚'),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            onPressed: requestAPI,
            child: const Icon(Icons.sync),
          ),
          SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            onPressed: requestAPI,
            child: const Icon(Icons.search),
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

  Future<void> requestAPI() async {
    showProgressDialog();

    try {
      var url = Uri.parse('http://api.booklog.jp/v2/json/2e2afb17c0ba25d2');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        print('response: ${response.body}');

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
