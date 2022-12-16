// ignore_for_file: prefer_const_constructors

import 'package:addstore/pages/HomePage.dart';
import 'package:flutter/material.dart';

class FiltroNaoLogadoPage extends StatelessWidget {
  FiltroNaoLogadoPage({Key? key}) : super(key: key);

  TextEditingController stateController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as FiltroNaoLogadoPageArguments;

    return Scaffold(
      appBar: AppBar(title: Text("Filtro dos anúncios"),),
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: stateController,
                          keyboardType: TextInputType.name,
                          onSaved: (newValue) => stateController.text = newValue!,
                          decoration: InputDecoration(
                            labelText: "Filtrar pelo estado",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: categoryController,
                          keyboardType: TextInputType.visiblePassword,
                          onSaved: (newValue) => categoryController.text = newValue!,
                          decoration: InputDecoration(
                              labelText: "Filtrar pela categoria",
                              border: OutlineInputBorder()
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(
                                context,
                                ExtractHomePageScreen.routeName,
                                arguments: HomePageArguments(
                                    args._loginStatus.toString(),
                                    null,
                                    stateController.text,
                                    categoryController.text,
                                    null,
                                    null
                                ));
                          },
                          icon: Icon(Icons.login_rounded),
                          label: Text("Filtrar")
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FiltroNaoLogadoPageArguments {
  final String _loginStatus;
  final int? _userId;

  FiltroNaoLogadoPageArguments(this._loginStatus, this._userId);
}
