// import 'dart:html';

import 'package:addstore/helper/anuntioTile.dart';
import 'package:addstore/model/anuncioModel.dart';
import 'package:addstore/model/userDataModel.dart';
import 'package:flutter/material.dart';


class AnuncioDetalheHelper extends StatelessWidget{
  final Anuncio anuncio;

  const AnuncioDetalheHelper(
    this.anuncio
    // this.photo,
  );

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final TextStyle titleStyle = TextStyle(
      fontSize: width * 0.05,
    );
    var title = anuncio.title;
    var price = anuncio.price;
    var telephone = anuncio.telephone;
    var description = anuncio.description;

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