import 'dart:convert';

import 'package:get/get.dart';

import '../Data/Data.dart';
import '../Models/CartModel.dart';
import '../Models/CartModel.dart';

class CartController extends  GetxController{


  List<Datum> cart=[];
  RxList<itemData> items=<itemData>[].obs;
  var TotalCost=0.obs ;

  Future<void> cartItem() async{
    var ls=jsonDecode(JsonString);
   cart.addAll(CartModel.fromJson( await jsonDecode(JsonString)).data);

  }
  Future<void> InCartItem( bool add ,itemData itemdata)async {
    if(add) {
      items.add(itemdata);
      TotalCost=TotalCost+int.parse(itemdata.price.toString());
    }
    else if(items.isNotEmpty && items.contains(itemdata)) {
      items.remove(itemdata);
      TotalCost.value=TotalCost.value-int.parse(itemdata.price.toString());

    };
  }




}
