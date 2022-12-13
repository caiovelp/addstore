// import 'dart:html';

import 'package:addstore/model/userDataModel.dart';
import 'package:flutter/material.dart';


class AnuncioDetalheHelper extends StatelessWidget{
  final String title;
  final double price;
  final String telephone;
  final String description;
  // final Blob photo;

  const AnuncioDetalheHelper(
    this.title,
    this.price,
    this.telephone,
    this.description,
    // this.photo,
  );

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text(this.title),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox( height: 20,),
          Row(
            children: [
              Text('Produto: '),
              Text(title)
            ],
          ),
          Row(
            children: [
              Text('Preco: '),
              Text(price.toString())
            ],
          ),
          Row(
            children: [
              Text('Descrição do produto: '),
              Text(description)
            ],
          ),
          Row(
            children: [
              Text('Telefone: '),
              Text(telephone)
            ],
          ),
        ],
      ),
    );
  }

}