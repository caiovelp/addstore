// import 'dart:html';

import 'package:addstore/helper/anuntioTile.dart';
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

    final TextStyle titleStyle = TextStyle(
      fontSize: width * 0.05,
    );

    return Scaffold(
      appBar: AppBar(title: Text("Detalhes"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnuncioTile('Produto: $title', Colors.amber.shade800),
              AnuncioTile('Valor: R\$ $price', Colors.green.shade800),
            ],
          ),
          SizedBox(height: 20),
          Text("Telefone p/ contato: $telephone", style: titleStyle,),
          SizedBox(height: 20),
          Text("Descrição do item: $description", style: titleStyle,),
        ],
      ),
    );
  }

}