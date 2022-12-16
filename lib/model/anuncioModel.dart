// import 'dart:html';

import 'package:addstore/model/userDataModel.dart';

class Anuncio {
  int? id;
  late String state;
  late String category;
  late String title;
  late double price;
  late String telephone;
  late String description;
  // final Blob photo;
  late int userID;

  Anuncio({
      required this.state,
      required this.category,
      required this.title,
      required this.price,
      required this.telephone,
      required this.description,
      // required this.photo,
      required this.userID,
  });

  Anuncio.fromMap(Map map) {
    this.id = map["id"];
    this.state = map["state"];
    this.category = map["category"];
    this.title = map["title"];
    this.price = map["price"];
    this.telephone = map["telephone"];
    this.description = map["description"];
    //this.photo = map["photo"];
    this.userID = map["user_id"];

  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "state": this.state,
      "category": this.category,
      "title": this.title,
      "price": this.price,
      "telephone": this.telephone,
      "description": this.description,
      //"photo": this.photo,
      "user_id": this.userID
    };

    map["id"] ??= this.id;

    return map;
  }
}
