import 'package:addstore/pages/HomePage.dart';
import 'package:addstore/pages/insertAnuncio.dart';
import 'package:addstore/pages/loginPage.dart';
import 'package:addstore/pages/cadastroPage.dart';
import 'package:addstore/pages/menuPage.dart';
import 'package:addstore/pages/myAnuncios.dart';
import 'package:addstore/pages/editAnuncio.dart';
import 'package:flutter/material.dart';

final routes = {
  '/': (BuildContext context) => LoginPage(),
  '/login': (BuildContext context) => LoginPage(),
  '/cadastro': (BuildContext context) => CadastroPage(),
  ExtractMenuPageScreen.routeName: (BuildContext context) => ExtractMenuPageScreen(),
  ExtractHomePageScreen.routeName: (BuildContext context) => ExtractHomePageScreen(),
  ExtractMyAnunciosPageScreen.routeName: (BuildContext context) => ExtractMyAnunciosPageScreen(),
  '/insertAnuncio': (BuildContext context) => InsertAnuncioPage(),
  '/updateAnuncio': (BuildContext context) => EditAnuncioPage(),
};

void main() {
  runApp(MaterialApp(
    title: "AddStore",
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(primarySwatch: Colors.deepOrange),
    routes: routes,
  ));
}