import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PagesController extends GetxController {
  PagesController();

  Future<void> openUrl(url) async {
    try {
      await launchUrl(url);
    } on Error {
      return;
    }

    /*if (!await launchUrl(url)) {
      null;
    }*/
  }
}