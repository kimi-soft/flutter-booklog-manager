import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class PageSettings extends StatefulWidget {
  const PageSettings({Key? key}) : super(key: key);

  @override
  State<PageSettings> createState() => _PageSettingsState();
}

class _PageSettingsState extends State<PageSettings> {
  bool lockAppSwitchVal = true;

  void _openUrl() async {
    const url = 'https://booklog.jp';

    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: false,
      );
    } else {
      throw 'このURLにはアクセスできません';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.settings),
        title: Text('設定'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('ユーザID'),
                  subtitle: Text('2e2afb17c0ba25d2'),
                  onTap: () {
                    print('tap');
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text('カバー画像'),
                  subtitle: Text('オフの場合はタイトルのみ表示されます'),
                  onTap: () {
                    setState(() {
                        lockAppSwitchVal = !lockAppSwitchVal;
                    });
                  },
                  trailing: Switch(
                    value: lockAppSwitchVal,
                    onChanged: (val) {
                      setState(() {
                          lockAppSwitchVal = val;
                      });
                    }
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.language),
                  title: Text('ブクログへ'),
                  subtitle: Text('ブラウザが起動します'),
                  onTap: () => _openUrl(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
