import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller/CartController.dart';
import 'Dependecies/init.dart';
import 'Screeens/Home.dart';
import 'Screeens/Splash.dart';

Future<void> main() async {
 await init();

  runApp(

      const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(debugShowCheckedModeBanner: false,
      title: 'Riding_moto',

      themeMode: ThemeMode.system,

      home:Splash(),
    );
  }
}
