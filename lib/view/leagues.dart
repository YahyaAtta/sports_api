import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_api/controller/leagues_controller.dart';

class Leagues extends StatelessWidget {
  Leagues({super.key});
  final LeaguesController leaguesController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(leaguesController.league == null
            ? "Default"
            : leaguesController.league!.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leaguesController.league == null
                ? const Text("No Image")
                : Image.network(leaguesController.league!.logo),
            const SizedBox(
              height: 20,
            ),
            Text("Type : ${leaguesController.league!.type}"),
          ],
        ),
      ),
    );
  }
}
