import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_api/view/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController controller;
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedRotation(
                turns: animation.value,
                onEnd: () {
                  Get.off(() => Home(),
                      curve: Curves.easeInBack,
                      duration: const Duration(seconds: 1),
                      transition: Transition.upToDown);
                },
                duration: const Duration(seconds: 2),
                child: const Icon(Icons.sports_soccer_rounded, size: 120)),
            const Text("FOOTBALL",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w300)),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
