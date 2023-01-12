import 'dart:convert';

import 'package:get/get.dart';
import 'package:shopping_cart/Const/Dimension/Dimension.dart';
import 'package:shopping_cart/Screeens/Home.dart';
import 'package:shopping_cart/Screeens/OrderPlaced.dart';

import '../Data/Data.dart';
import '../Models/CartModel.dart';
import '../Models/CartModel.dart';
import '../Widgets/Progress.dart';

class CartController extends  GetxController{


  List<Datum> cart=[];
  RxList<itemData> items=<itemData>[].obs;
  var TotalCost=0.obs ;
  var check = Map<itemData, int>();


  cartItem() async{
    var ls=jsonDecode(JsonString);
   cart.addAll(CartModel.fromJson( await jsonDecode(JsonString)).data);

  }
   InCartItem( bool add ,itemData itemdata)async {
    if(add) {
      items.add(itemdata);
      TotalCost=TotalCost+int.parse(itemdata.price.toString());
      if(check.containsKey(itemdata)){
        check[itemdata]=check[itemdata]!+1;
      }else {
        check.putIfAbsent(itemdata, () => 1);
      }
    }
    else if(items.isNotEmpty && items.contains(itemdata)) {
      items.remove(itemdata);
      TotalCost.value=TotalCost.value-int.parse(itemdata.price.toString());
      if(check.containsKey(itemdata)){
        check[itemdata]=check[itemdata]!-1;
      }if(check[itemdata]==0){
        check.remove(itemdata);
      }


    };
  }


placeorder()async {

    progress();
   await Future.delayed(Duration(seconds: 1)).whenComplete(() {

     cart.clear();items.clear();check.clear();TotalCost.value=0;
   });

    Get.back();
    Get.off(OrderPlaced());
}

}
