// import 'dart:html';

import 'package:addstore/model/anuncioModel.dart';
import 'package:addstore/model/userDataModel.dart';
import 'package:flutter/material.dart';


class AnuncioDetalheHelper extends StatelessWidget{
  final Anuncio anuncio;
  // final Blob photo;

  const AnuncioDetalheHelper(
    this.anuncio
  );

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text(anuncio.title),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox( height: 20,),
          Row(
            children: [
              Text('Produto: '),
              Text(anuncio.title)
            ],
          ),
          Row(
            children: [
              Text('Preco: '),
              Text(anuncio.price.toString())
            ],
          ),
          Row(
            children: [
              Text('Descrição do produto: '),
              Text(anuncio.description)
            ],
          ),
          Row(
            children: [
              Text('Telefone: '),
              Text(anuncio.telephone)
            ],
          ),
        ],
      ),
    );
  }

}