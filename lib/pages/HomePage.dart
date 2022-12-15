// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:addstore/controller/anuncioController.dart';
import 'package:addstore/model/anuncioModel.dart';
import 'package:addstore/model/userDataModel.dart';
import 'package:addstore/pages/menuPage.dart';
import 'package:flutter/material.dart';

class ExtractHomePageScreen extends StatelessWidget {
  ExtractHomePageScreen({Key? key}) : super(key: key);

  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as HomePageArguments;

    if (args._loginStatus.toString() == "LoginStatus.signIn") {
      return Scaffold(
        appBar: AppBar(
          title: Text("Logado"),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context,
                      ExtractMenuPageScreen.routeName,
                      arguments: MenuPageArguments(
                          args._loginStatus.toString(),
                          ));
                },
                icon: Icon(
                  Icons.menu_rounded,
                  size: 35,
                ))
          ],
        ),

      );
    }
    else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Não Logado"),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context,
                      ExtractMenuPageScreen.routeName,
                      arguments: MenuPageArguments(
                          args._loginStatus.toString(),
                          ));
                },
                icon: Icon(
                  Icons.menu_rounded,
                  size: 35,
                ))
          ],
        ),
        body: HomePageBody(),
      );
    }
  }
}

class HomePageBody extends StatelessWidget {
  HomePageBody({Key? key}) : super(key: key);

  var _dbAnuncioController = AnuncioController();

  List<Anuncio> anuncios = [];

  Anuncio anuncio = Anuncio(
      state: "RJ",
      category: "Objeto",
      title: "Caneta azul",
      price: 0.99,
      telephone: "(21) 999999999999",
      description: "Azul caneta");

  @override
  Widget build(BuildContext context) {
    final ScrollController _firstController = ScrollController();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        TextButton(
            onPressed: () {
              _dbAnuncioController.insertAnuncio(anuncio);
            },
            child: Text("Inserir anúncio"),
        ),
        Expanded(
          child: FutureBuilder<List<Anuncio>>(
            future: AnuncioController().getAnuncios(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Scrollbar(
                    thumbVisibility: true,
                    controller: _firstController,
                    child: Column(
                      children: [
                        Expanded(
                            child: ListView.builder(
                                controller: _firstController,
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.02, vertical: height * 0.02),
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  final item = snapshot.data![index];
                                  return Card(
                                    child: ListTile(
                                      trailing: Icon(Icons.play_arrow, size: height * 0.02),
                                      title: Text(item.title),
                                    ),
                                  );
                                }
                            )
                        )
                      ],
                    )
                );
              }
              else {
                return const CircularProgressIndicator();
              }
            },
          )
        )
      ],
    );
  }
}


class HomePageArguments {
  final String _loginStatus;
  final User? user;

  HomePageArguments(this._loginStatus, this.user);
}
