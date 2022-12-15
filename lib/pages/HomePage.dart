// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:addstore/pages/menuPage.dart';
import 'package:flutter/material.dart';

class ExtractHomePageScreen extends StatelessWidget {
  const ExtractHomePageScreen({Key? key}) : super(key: key);

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
      );
    }
  }
}

class HomePageArguments {
  final String _loginStatus;

  HomePageArguments(this._loginStatus);
}
