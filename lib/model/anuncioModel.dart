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
  //late User user;

  Anuncio({
      required this.state,
      required this.category,
      required this.title,
      required this.price,
      required this.telephone,
      required this.description,
      // required this.photo,
      //required this.user,
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
    //this.user = map["user"];

  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "state": this.state,
      "category": this.category,
      "title": this.title,
      "category": this.category,
      "price": this.price,
      "telephone": this.telephone,
      "description": this.description,
      //"photo": this.photo,
      //"user": this.user
    };

    map["id"] ??= this.id;

    return map;
  }
}
