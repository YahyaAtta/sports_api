import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_api/bindings/my_bindings.dart';
import 'package:sports_api/view/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sports',
      defaultTransition: Transition.rightToLeftWithFade,
      initialBinding: MyBindings(),
      debugShowCheckedModeBanner: false,
      home: const Splash(),
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
    );
  }
}
