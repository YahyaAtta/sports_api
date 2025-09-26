import 'package:get/get.dart';
import 'package:sports_api/model/api_key.dart';
import 'package:dio/dio.dart' as d;

class HomeController extends GetxController {
  Map<String, String>? headers = {'x-rapidapi-key': getApiKey};
  d.Dio dio = d.Dio();
  Future getLeagues() async {
    try {
      d.Response response = await dio.get(
          "https://v3.football.api-sports.io/leagues",
          queryParameters: {'season': 2021},
          options: d.Options(
              headers: headers,
              sendTimeout: const Duration(minutes: 1),
              receiveTimeout: const Duration(minutes: 1)));

      Map<String, dynamic> data = response.data;
      if (response.statusCode == 200) {
        return data;
      } else {
        return Exception("Failed to Load Leagues");
      }
    } on d.DioException catch (e) {
      Exception(e.message.toString());
      return [];
    }
  }

  Future getPlayers() async {
    try {
      d.Response response = await dio.get(
        "https://v3.football.api-sports.io/players/profiles",
        options: d.Options(
            headers: headers,
            sendTimeout: const Duration(minutes: 1),
            receiveTimeout: const Duration(minutes: 1)),
      );

      Map<String, dynamic> data = response.data;
      if (response.statusCode == 200) {
        return data;
      } else {
        return Exception("Failed to Load Players");
      }
    } on d.DioException catch (e) {
      Exception(e.message.toString());
      return [];
    }
  }

  @override
  void onInit() {
    getLeagues();
    getPlayers();
    super.onInit();
  }
}
