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
  var _controller = TextEditingController();

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
                _settingsUserId(),
                const Divider(),
                _settingsDisplayImage(),
                const Divider(),
                _settingsGotoBooklog(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _settingsUserId() {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text('ブクログID'),
      subtitle: Text(SettingsManager().userId),
      onTap: () {
        _dialogUserIdAsync(context);
      },
    );
  }

  Widget _settingsDisplayImage() {
    return ListTile(
      leading: const Icon(Icons.image),
      title: const Text('表紙の表示'),
      subtitle: Text('オフの場合は代わりの画像が表示されます'),
      onTap: () => _changeDisplayImage(!SettingsManager().isDisplayImage),
      trailing: Switch(
        value: SettingsManager().isDisplayImage,
        onChanged: (val) => _changeDisplayImage(val),
      ),
    );
  }

  Widget _settingsGotoBooklog() {
    return ListTile(
      leading: Icon(Icons.language),
      title: Text('ブクログへ'),
      subtitle: Text('ブラウザが起動します'),
      onTap: () => UrlLauncher.openUrl('https://booklog.jp'),
    );
  }

  void _changeDisplayImage(bool isDisplayImage) {
    setState(() {
      SettingsManager().isDisplayImage = isDisplayImage;
      SettingsManager().save();
    });
  }

  Future<void> _dialogUserIdAsync(BuildContext context) async {
    _controller.text = SettingsManager().userId;

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('ブクログID'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: "ここに入力"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('キャンセル'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                setState(() {
                  SettingsManager().userId = _controller.text;
                  SettingsManager().save();
                });

                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
