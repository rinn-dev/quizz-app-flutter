import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class MenuDrawerController extends GetxController {
  final drawerController = ZoomDrawerController();

  void toggleDrawer() {
    drawerController.toggle?.call();
    update();
  }
}
