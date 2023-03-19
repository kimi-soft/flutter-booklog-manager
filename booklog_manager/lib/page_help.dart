import 'package:flutter/material.dart';

class PageHelp extends StatefulWidget {
  const PageHelp({Key? key}) : super(key: key);

  @override
  State<PageHelp> createState() => _PageHelpState();
}

class _PageHelpState extends State<PageHelp> {
  void _changeDisplayImage(bool isDisplayImage) {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.help),
        title: Text('ヘルプ'),
      ),
    );
  }
}
