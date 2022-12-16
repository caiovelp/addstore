// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, empty_catches, prefer_final_fields, use_build_context_synchronously

import 'package:addstore/controller/loginController.dart';
import 'package:addstore/helper/dataBaseHelper.dart';
import 'package:addstore/pages/HomePage.dart';
import 'package:addstore/pages/filtroLogadoPage.dart';
import 'package:addstore/pages/filtroNaoLogadoPage.dart';
import 'package:flutter/material.dart';

enum LoginStatus { notSignIn, signIn }

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var _dbUserController = LoginController();

  void _submitLogin() async {
    final form = _formKey.currentState;

    if (form!.validate()) {
      form.save();

      try {
        var username = nameController.text;
        var password = passwordController.text;
        int foundUser = await _dbUserController.getLogin(username, password);
        if (foundUser != 1) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Usuário não cadastrado!'))
          );
        }
        else{
          nameController.clear();
          passwordController.clear();
          _loginStatus = LoginStatus.signIn;

          var userInfo = await _dbUserController.retrieveUserID(username);
          var id = userInfo.elementAt(0).id;

          Navigator.pushNamed(
              context,
              '/filtroLogged',
              arguments: FiltroLogadoPageArguments(
                  _loginStatus.toString(),
                  id
              ));
        }
      }
      catch (exception) {

      }
    }
  }

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
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        onSaved: (newValue) => nameController.text = newValue!,
                        decoration: InputDecoration(
                          labelText: "Username",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        onSaved: (newValue) => passwordController.text = newValue!,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder()
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                        onPressed: () {
                          _submitLogin();
                        },
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
                        nameController.clear();
                        passwordController.clear();
                        Navigator.pushNamed(context, '/cadastro');
                      },
                      style: styleText,
                      child: Text("Cadastrar")
                  ),
                  TextButton(
                      onPressed: () {
                        DataBaseHelper().deleteDatabase("mydatabase.db");
                      },
                      style: styleText,
                      child: Text("DELETE DATABASE")
                  ),
                  TextButton(
                    onPressed: () {
                        nameController.clear();
                        passwordController.clear();
                        _loginStatus = LoginStatus.notSignIn;
                        Navigator.pushNamed(
                            context,
                            '/filtroUnlogged',
                            arguments: FiltroNaoLogadoPageArguments(
                                _loginStatus.toString(),
                                null
                                ));
                      },
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
