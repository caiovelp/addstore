import 'package:addstore/pages/HomePage.dart';
import 'package:addstore/pages/filtroLogadoPage.dart';
import 'package:addstore/pages/filtroNaoLogadoPage.dart';
import 'package:addstore/pages/loginPage.dart';
import 'package:addstore/pages/cadastroPage.dart';
import 'package:addstore/pages/menuPage.dart';
import 'package:flutter/material.dart';

final routes = {
  '/': (BuildContext context) => LoginPage(),
  '/login': (BuildContext context) => LoginPage(),
  '/cadastro': (BuildContext context) => CadastroPage(),
  ExtractMenuPageScreen.routeName: (BuildContext context) => ExtractMenuPageScreen(),
  ExtractHomePageScreen.routeName: (BuildContext context) => ExtractHomePageScreen(),
  '/filtrologado': (BuildContext context) => FiltroLogadoPage(),
  'filtronaologado': (BuildContext context) => FiltroNaoLogadoPage()
};

void main() {
  runApp(MaterialApp(
    title: "AddStore",
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(primarySwatch: Colors.deepOrange),
    routes: routes,
  ));
}