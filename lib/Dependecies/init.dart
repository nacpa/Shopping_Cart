import 'package:get/get.dart';
import 'package:shopping_cart/Controller/CartController.dart';

Future<void> init()async {

  Get.lazyPut(() => CartController(),fenix: true);
}