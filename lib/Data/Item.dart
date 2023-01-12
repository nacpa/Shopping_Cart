



import '../Models/CartModel.dart';

class Item {
  String headerValue;
  List<itemData> expandedValue;
  bool isExpanded;

  Item({
    required   this.headerValue,
    required this.expandedValue,
    this.isExpanded = false,
  });
}