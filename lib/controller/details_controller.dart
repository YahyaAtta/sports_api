import 'package:get/get.dart';

import '../model/players.dart';

class DetailsController extends GetxController {
  Player? player;
  @override
  void onInit() {
    player = Get.arguments;
    super.onInit();
  }
}
