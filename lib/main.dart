import 'package:addstore/pages/loginPage.dart';
import 'package:addstore/pages/cadastroPage.dart';
import 'package:flutter/material.dart';

final routes = {
  '/': (BuildContext context) => LoginPage(),
  '/login': (BuildContext context) => LoginPage(),
  '/cadastro': (BuildContext context) => CadastroPage()
};

void main() {
  runApp(MaterialApp(
    title: "AddStore",
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(primarySwatch: Colors.deepOrange),
    routes: routes,
  ));
}