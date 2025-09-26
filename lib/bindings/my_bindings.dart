import 'package:get/get.dart';
import 'package:sports_api/controller/about_controller.dart';
import 'package:sports_api/controller/home_controller.dart';
import 'package:sports_api/controller/leagues_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<LeaguesController>(() => LeaguesController(), fenix: true);
    Get.lazyPut<AboutController>(() => AboutController(), fenix: true);
  }
}
