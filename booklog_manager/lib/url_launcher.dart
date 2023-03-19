import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static void openUrlAsync(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: false,
      );
    }
  }
}
