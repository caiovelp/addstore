// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();
  String? _username, _password;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: TextStyle(fontSize: 25),
      elevation: 5,
    );

    final ButtonStyle styleText = ElevatedButton.styleFrom(
      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );

    return Scaffold(
      appBar: AppBar(title: Text("Cadastro"),),
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                elevation: 0,
                color: Colors.deepOrange,
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(Icons.app_registration_rounded, size: 80,),
                      Center(
                          child: Text(
                            "Cadastre-se",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold)
                          )
                      )
                    ],
                  ),
                ),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          onSaved: (newValue) => _username = newValue,
                          decoration: InputDecoration(
                            labelText: "Username",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          onSaved: (newValue) => _password = newValue,
                          decoration: InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder()
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () => {},
                          style: style,
                          child: Text("Cadastrar")
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: styleText,
                          child: Text("Voltar para Login"))
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
