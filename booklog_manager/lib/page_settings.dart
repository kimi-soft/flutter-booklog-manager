import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:booklog_manager/settings_manager.dart';
import 'package:booklog_manager/url_launcher.dart';

class PageSettings extends StatefulWidget {
  const PageSettings({Key? key}) : super(key: key);

  @override
  State<PageSettings> createState() => _PageSettingsState();
}

class _PageSettingsState extends State<PageSettings> {
  void _changeDisplayImage(bool isDisplayImage) {
    setState(() {
        SettingsManager().isDisplayImage = isDisplayImage;
        SettingsManager().save();
    });
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
                  subtitle: Text(SettingsManager().userId),
                  onTap: () {
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text('カバー画像'),
                  subtitle: Text('オフの場合はタイトルのみ表示されます'),
                  onTap: () => _changeDisplayImage(!SettingsManager().isDisplayImage),
                  trailing: Switch(
                    value: SettingsManager().isDisplayImage,
                    onChanged: (val) => _changeDisplayImage(val),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.language),
                  title: Text('ブクログへ'),
                  subtitle: Text('ブラウザが起動します'),
                  onTap: () => UrlLauncher.openUrl('https://booklog.jp'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
