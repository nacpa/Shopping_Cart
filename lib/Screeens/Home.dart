import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_cart/Controller/CartController.dart';

import '../Const/Dimension/Dimension.dart';
import '../Data/Data.dart';
import '../Data/Item.dart';
import 'CheckOut.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  bool isExpanded = false;
  final _controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().cartItem();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    )),
                Text(
                  "My Cart",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: D.Hight20,
                      fontWeight: FontWeight.bold),
                ),
                Obx(() => Stack(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          size: D.Hight30,
                          color: Colors.black54,
                        ),
                        Positioned(top: 0,right: 0,
                          child:_controller.items.length!=0? CircleAvatar(
                            backgroundColor: Colors.orange,
                            radius: 10,
                            child: Text(
                              _controller.items.length.toString(),
                              style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                            ),
                          ):Container(),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Opacity(opacity: 0.1,
            child: Container(color: Colors.grey.shade100,
              child: Lottie.network("https://assets7.lottiefiles.com/packages/lf20_13qczqum.json"),)),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  StatefulBuilder(builder: (context, st) {
                    return ExpansionPanelList(
                      dividerColor: Colors.grey.shade50,
                      expandedHeaderPadding: const EdgeInsets.all(10),
                      elevation: 1,
                      expansionCallback: (int index, bool isExpanded) {
                        st(() {
                          data[index].isExpanded = isExpanded;
                        });
                      },
                      children: data.map<ExpansionPanel>((Item item) {
                        return ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return Container(
                              margin: EdgeInsets.only(
                                  left: D.Hight10, top: D.Hight10),
                              height: D.Hight100 / 2.5,
                              child: Text(
                                item.headerValue,
                                style: TextStyle(fontSize: D.Hight30 / 1.5),
                              ),
                            );
                          },
                          body: Container(
                            margin: EdgeInsets.symmetric(horizontal: D.Hight10),
                            height:
                                item.expandedValue.length * (D.Hight100 / 1.5),
                            child: ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                itemCount: item.expandedValue.length,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, i) {
                                  var cartitem = 0.obs;
                                  return ListTile(
                                    title:
                                        Text(item.expandedValue[i].name ?? ""),
                                    subtitle: Text(
                                        "₹ ${item.expandedValue[i].price}" ??
                                        ""),
                                    trailing: InkWell(onTap: (){

                                      if(cartitem==0) {
                                        cartitem++;
                                        _controller
                                            .InCartItem(
                                            true,
                                            item.expandedValue[
                                            i]);
                                      }
                                    },
                                      child: Container(
                                        height: D.Hight100 / 3,
                                        width: D.Hight100,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              D.Hight20),
                                          border: Border.all(
                                              color: Colors.orange),
                                        ),
                                        child:Obx(() => cartitem == 0
                                            ?  const Center(
                                            child: Text(
                                              "Add",
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  color: Colors.orange),
                                            ))
                                            : Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  cartitem.value++;
                                                  _controller
                                                    .InCartItem(
                                                    true,
                                                    item.expandedValue[
                                                    i]);},
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Colors.orange,
                                                )),
                                            CircleAvatar(
                                                backgroundColor:
                                                Colors.orange,
                                                radius: D.Hight30 / 2,
                                                child: Text(cartitem.value
                                                    .toString(),
                                                  style: const TextStyle(
                                                      color: Colors
                                                          .white),
                                                )),
                                            InkWell(
                                                onTap: (){
                                                  cartitem.value--;
                                                  _controller
                                                      .InCartItem(
                                                      false,
                                                      item.expandedValue[
                                                      i]);},
                                                child: const Icon(
                                                  Icons.remove,
                                                  color: Colors.orange,
                                                ))
                                          ],
                                        ),)


                                      ),
                                    ),
                                  );
                                }),
                          ),
                          isExpanded: !item.isExpanded,
                        );
                      }).toList(),
                    );
                  }),
                  SizedBox(height: D.Hight100, width: double.maxFinite),
                ],
              ),
            ),
            Positioned(
                bottom: D.Hight10,
                left: D.Hight10,
                right: D.Hight10,
                child: InkWell(onTap: (){
                  if(_controller.items.isNotEmpty){
                    Get.to( Checkout(),transition: Transition.leftToRightWithFade);
                  }
                },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: D.Hight20),
                    height: D.Hight100 / 1.5,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.orange,
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
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center
                            ,
                            children: [
                              Icon(Icons.lock,color: Colors.white,size: D.Hight30,),
                              SizedBox(width: D.Hight10/2,),
                              Text(
                                "CheckOut",
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
                )),
          ],
        ),
      ),
    );
  }
}
