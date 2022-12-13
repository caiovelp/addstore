// import 'dart:html';

import 'package:addstore/model/userDataModel.dart';

class Anuncio {
  final int id;
  final String state;
  final String category;
  final String title;
  final double price;
  final String telephone;
  final String description;
  // final Blob photo;
  final User user;

  Anuncio({
      required this.id,
      required this.state,
      required this.category,
      required this.title,
      required this.price,
      required this.telephone,
      required this.description,
      // required this.photo,
      required this.user,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'state': state,
      'category': category,
      'title': title,
      'telephone': telephone,
      'description': description,
      // 'photo': photo,
      'user': user,
    };
  }

  factory Anuncio.fromMap(Map<String,dynamic> maps) {
    return Anuncio(
        description: maps['description'],
        // photo: maps['photo'],
        id: maps['id'],
        state: maps['state'],
        category: maps['category'],
        title: maps['title'],
        price: maps['price'],
        telephone: maps['telephone'],
        user: maps['user'],
    );
  }
}
