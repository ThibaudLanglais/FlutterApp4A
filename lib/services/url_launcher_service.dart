import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
    static Future<void> openInBrowser({required String url}) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}