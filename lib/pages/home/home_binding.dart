import 'package:get/get.dart';
import 'package:port/pages/home/controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeViewController>(HomeViewController());
  }
}
