// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:addstore/controller/anuncioController.dart';
import 'package:addstore/helper/AnuncioDetalheHelper.dart';
import 'package:addstore/model/anuncioModel.dart';
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
                          args.userID
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
                          args.userID
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


  @override
  Widget build(BuildContext context) {
    final ScrollController _firstController = ScrollController();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final TextStyle titleStyle = TextStyle(
      fontSize: width * 0.07,
      fontWeight: FontWeight.bold,
    );

    final TextStyle subTitleStyle = TextStyle(
      fontSize: width * 0.04,
      fontStyle: FontStyle.italic,
    );

    return Column(
      children: [
        Expanded(
          child: FutureBuilder<List<Anuncio>>(
            future: _dbAnuncioController.getAnuncios(),
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
                                      title: Text(item.title, style: titleStyle),
                                      subtitle: Text("R\$ ${item.price} - Estado: ${item.state} - Categoria ${item.category}", style: subTitleStyle,),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => AnuncioDetalheHelper(
                                                    item.title,
                                                    item.price,
                                                    item.telephone,
                                                    item.description)
                                            )
                                        );
                                      },
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
  final int? userID;

  HomePageArguments(this._loginStatus, this.userID);
}
