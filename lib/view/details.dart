import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_api/controller/details_controller.dart';

// ignore: must_be_immutable
class Details extends StatelessWidget {
  final DetailsController c = Get.put(DetailsController());
  Details({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(c.player == null ? "Default" : c.player!.name,
                  style: const TextStyle(fontSize: 25)),
            ],
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: c.player == null
                  ? const Icon(Icons.sports_soccer)
                  : Image.network(
                      c.player!.photo,
                      height: 200,
                      width: 200,
                    ),
            ),
          ],
        ));
  }
}
