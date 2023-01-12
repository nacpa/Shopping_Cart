import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_cart/Screeens/Home.dart';

import '../Const/Dimension/Dimension.dart';

class OrderPlaced extends StatelessWidget {
  const OrderPlaced({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(height: D.Hight100*2,),
                SizedBox(height: D.Hight100*2,width: D.Hight100*2,
                    child: Center(child: Lottie.network("https://assets8.lottiefiles.com/packages/lf20_vndgzois.json"))),
                Text("Your Order Sucessfully Placed",style: TextStyle(fontSize: D.Hight20),)
              ],
            ),
          ),
          Expanded(flex: 1,
              child: Center(
                child: InkWell(onTap: (){
                  Get.offAll(Home());
                },
                  child: Container(height: D.Hight100/2,width:D.Hight100*2.5,decoration: BoxDecoration(
                      color: Colors.orangeAccent.withOpacity(0.5),border: Border.all(color: Colors.orange),

                      borderRadius: BorderRadius.circular(D.Hight20)),
                    child: Center(
                      child: Text("Go Back To Main Menu",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,
                          fontSize: D.Hight20),),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
