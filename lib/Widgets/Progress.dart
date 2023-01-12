import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Const/Dimension/Dimension.dart';

void progress(){


  Get.defaultDialog(barrierDismissible: false,
      title:"Placing Order",backgroundColor: Colors.black.withOpacity(0.5),titleStyle: const TextStyle(color: Colors.white),
      content:  SizedBox(height: D.Hight100,
        child: const Center(
          child:CircularProgressIndicator(color: Colors.orangeAccent,)
          ,
        ),
      ));
}