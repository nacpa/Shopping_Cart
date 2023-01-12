import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../Const/Dimension/Dimension.dart';
import '../Controller/CartController.dart';

class Checkout extends StatelessWidget {
  Checkout({Key? key}) : super(key: key);
  final _controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    // _controller.checkout(_controller.items);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconTheme.of(context),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text(
            "Check Out",
            style: TextStyle(
                color: Colors.black,
                fontSize: D.Hight20,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Stack(
        children: [
          Opacity(opacity: 0.1,
              child: Container(color: Colors.grey.shade100,
                child: Lottie.network("https://assets7.lottiefiles.com/packages/lf20_13qczqum.json"),)),
          Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(D.Hight20),
                    topRight: Radius.circular(D.Hight20))),
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: D.Hight20),
                itemCount: _controller.check.length,
                itemBuilder: (context, i) {
                  print(_controller.check.keys.length,);

                  return Container(
                    margin: EdgeInsets.only(top: D.Hight20),
                    height: D.Hight100/1.3,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(D.Hight20),
                        border: Border.all(color: Colors.grey.shade50),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(-1, 1),
                              blurRadius: 1,
                              spreadRadius: 1,
                              color: Colors.blueGrey.shade100),
                          BoxShadow(
                              offset: const Offset(1, -1),
                              blurRadius: 2,
                              spreadRadius: 2,
                              color: Colors.grey.shade200),
                        ]),
                    child: Center(
                      child: ListTile(
                        title: Text(
                          "${_controller.check.values.toList()[i]}× ${_controller.check.keys.toList()[i].name} " ,

                          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                        ),subtitle: Text(
                        _controller.items[i].instock!?"In Stock":"Out Off Stock"??"",
                        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15,color: Colors.green),
                      ),trailing: Text(
                        "₹ ${_controller.check.keys.toList()[i].price! * _controller.check.values.toList()[i]}"  ?? "",
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                      ),
                      ),
                    ),
                  );
                }),
          ),

          Positioned(
              bottom: D.Hight10,
              left: D.Hight10,
              right: D.Hight10,
              child: InkWell(onTap: (){

              },
                child: InkWell(onTap: (){
                  _controller.placeorder();

                },
                  child: Container(margin: EdgeInsets.symmetric(horizontal: D.Hight20),
                    height: D.Hight100 / 1.5,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(D.Hight20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.orange.shade50,
                            blurRadius: 2,
                            spreadRadius: 1,
                            offset: const Offset(1, -1))
                      ],
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Icon(Icons.lock,color: Colors.white,size: D.Hight30,),
                              SizedBox(width: D.Hight10/2,),
                              Text(
                                "Place Order",
                                style: TextStyle(
                                    fontSize: D.Hight20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Obx(() => Text(
                            "₹ ${_controller.TotalCost.value.toString()}",
                            style: TextStyle(
                                fontSize: D.Hight20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
