// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:addstore/controller/registroController.dart';
import 'package:addstore/model/userDataModel.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var _dbUserController = RegistroController();

  void _submitRegistration() async {
    String username = nameController.text;
    String password = passwordController.text;
    String email = emailController.text;

    User user = User(
      name: username, password: password, email: email
    );

    int found = await _dbUserController.retrieveData(user);

    if (found == 1) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Username já cadastrado!'))
      );
    }
    else if (found == 2) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email já cadastrado!'))
      );
    }
    else if(found == 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email inválido, digite um e-mail com '@'"))
      );
    }
    else
    {
      await _dbUserController.insertUser(user);
      nameController.clear();
      passwordController.clear();
      emailController.clear();
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
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (newValue) => emailController.text = newValue!,
                          decoration: InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder()
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _submitRegistration();
                          },
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
