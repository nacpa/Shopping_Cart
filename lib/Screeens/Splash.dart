import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/Screeens/Home.dart';
import '../Const/Dimension/Dimension.dart';
import '../Controller/CartController.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {

  late Animation<double> animation;

  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<CartController>().cartItem();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..forward().whenComplete(() => Get.to(Home()));
    animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

  }





  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Center(
            child: ScaleTransition(
              scale: animation,
              child: Container(
                height: D.Hight / 4,
                width: D.Hight / 3,child: Icon(Icons.restaurant_sharp,size: D.Hight100,color: Colors.orange,)
               ,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
