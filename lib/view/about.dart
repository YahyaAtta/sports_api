import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_api/controller/about_controller.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController controller;
  final AboutController aboutController = Get.find();
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween(begin: 0.0, end: 2.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beginner Programmer"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 40, left: 4, right: 4, bottom: 4),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/OIU.png',
                        height: 70,
                      ),
                    ),
                    const Column(
                      children: [
                        Text("Omdurman Islamic University\n",
                            style: TextStyle(fontSize: 14.75)),
                        Text(
                            "Faculty Of Computer Science\nAnd Information Technology",
                            style: TextStyle(fontSize: 14.75)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/OIU.FCSIT.png',
                        height: 70,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                AnimatedRotation(
                    turns: animation.value,
                    onEnd: () {},
                    duration: const Duration(seconds: 2),
                    child: const Icon(Icons.sports_soccer_rounded, size: 100)),
                const SizedBox(
                  height: 20,
                ),
                const Text('FOOTBALL Version 1.0',
                    style: TextStyle(fontSize: 20)),
                const Text(
                  "Developed By Yahya Atta\nFourth Year\nComputer Science(CS)\nGithub:YahyaAtta",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
