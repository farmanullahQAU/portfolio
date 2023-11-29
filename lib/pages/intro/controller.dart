import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroViewController extends GetxController {

  final String greetings="👋 GREETINGS! I'M ";
  final String role="SENIOR FLUTTER DEVELOPER";

  final String  aboutDesc="with a passion for crafting seamless user experiences. Over the last three years, I've honed my skills in Flutter, consistently delivering easy-to-use and visually striking mobile and web applications.";  Future<void> openUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
