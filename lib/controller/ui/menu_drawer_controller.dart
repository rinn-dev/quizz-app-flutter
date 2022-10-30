import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuDrawerController extends GetxController {
  final drawerController = ZoomDrawerController();

  void toggleDrawer() {
    drawerController.toggle?.call();
    update();
  }

  Future<void> sendMail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'smith@example.com',
    );
    if (!await launchUrl(emailLaunchUri)) {
      throw "Permission Denied!";
    }
  }
}
