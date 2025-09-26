import 'package:get/get.dart';
import 'package:sports_api/model/leagues.dart';

class LeaguesController extends GetxController {
  League? league;

  @override
  void onInit() {
    league = Get.arguments;
    super.onInit();
  }
}
