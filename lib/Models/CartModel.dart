// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) =>   json.encode(data.toJson());

class CartModel {
  CartModel({
     this.status,
    required this.data,
  });

  String? status;
  List<Datum> data;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    status: json["Status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.popularItem,
    required this.salad,
    required this.chinise,
    required this.soups,
    required this.tandori,
    required this.southIndian,
  });

  List<itemData> popularItem;
  List<itemData> salad;
  List<itemData> chinise;
  List<itemData> soups;
  List<itemData> tandori;
  List<itemData> southIndian;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    popularItem: List<itemData>.from(json["Popular Item"].map((x) => itemData.fromJson(x))),
    salad: List<itemData>.from(json["Salad"].map((x) => itemData.fromJson(x))),
    chinise: List<itemData>.from(json["Chinise"].map((x) => itemData.fromJson(x))),
    soups: List<itemData>.from(json["Soups"].map((x) => itemData.fromJson(x))),
    tandori: List<itemData>.from(json["Tandori"].map((x) => itemData.fromJson(x))),
    southIndian: List<itemData>.from(json["South Indian"].map((x) => itemData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Popular Item": List<dynamic>.from(popularItem.map((x) => x.toJson())),
    "Salad": List<dynamic>.from(salad.map((x) => x.toJson())),
    "Chinise": List<dynamic>.from(chinise.map((x) => x.toJson())),
    "Soups": List<dynamic>.from(soups.map((x) => x.toJson())),
    "Tandori": List<dynamic>.from(tandori.map((x) => x.toJson())),
    "South Indian": List<dynamic>.from(southIndian.map((x) => x.toJson())),
  };
}

class itemData {
  itemData({
    this.name,
    this.price,
    this.instock,
  });

  String? name;
  int? price;
  bool? instock;

  factory itemData.fromJson(Map<String, dynamic> json) => itemData(
    name: json["name"],
    price: json["price"],
    instock: json["instock"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "instock": instock,
  };
}
