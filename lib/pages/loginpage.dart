// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
      appBar: AppBar(title: Text("Login"),),
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('images/logo.png'),
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
                    ElevatedButton.icon(
                        onPressed: () => {},
                        style: style,
                        icon: Icon(Icons.login_rounded),
                        label: Text("Entrar")
                    ),
                  ],
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cadastro');
                      },
                      style: styleText,
                      child: Text("Registrar")
                  ),
                  TextButton(
                      onPressed: () => {},
                      style: styleText,
                      child: Text("Ver anúncios"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
