// import 'dart:html';

import 'package:addstore/controller/anuncioController.dart';
import 'package:addstore/model/anuncioModel.dart';
import 'package:addstore/model/userDataModel.dart';
import 'package:flutter/material.dart';


class MeuAnuncioDetalheHelper extends StatelessWidget{
  final Anuncio anuncio;
  final int id;
  final String title;
  final double price;
  final String telephone;
  final String description;
  // final Blob photo;

  const MeuAnuncioDetalheHelper(this.anuncio)

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text(this.anuncio.title),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox( height: 20,),
          Row(
            children: [
              Text('Produto: '),
              Text(this.anuncio.title)
            ],
          ),
          Row(
            children: [
              Text('Preco: '),
              Text(this.anuncio.price.toString())
            ],
          ),
          Row(
            children: [
              Text('Descrição do produto: '),
              Text(this.anuncio.description)
            ],
          ),
          Row(
            children: [
              Text('Telefone: '),
              Text(this.anuncio.telephone)
            ],
          ),
          Row(
            children: [
              ElevatedButton(onPressed: () {
                AnuncioController().delete(anuncio);
              }, child: Text('Deletar')),
              ElevatedButton(onPressed: () {

              }, child: Text('Deletar'),)
            ],
          )
        ],
      ),
    );
  }

}