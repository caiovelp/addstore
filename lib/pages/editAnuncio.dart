// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, empty_catches, prefer_final_fields, use_build_context_synchronously

import 'package:addstore/controller/anuncioController.dart';
import 'package:addstore/model/anuncioModel.dart';
import 'package:addstore/pages/myAnuncios.dart';
import 'package:flutter/material.dart';


class EditAnuncioPage extends StatefulWidget {
  const EditAnuncioPage({Key? key}) : super(key: key);

  static const routeName = '/updateAnuncio';

  @override
  State<EditAnuncioPage> createState() => _EditAnuncioPageState();
}

class _EditAnuncioPageState extends State<EditAnuncioPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  var _dbAnuncioController = AnuncioController();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: TextStyle(fontSize: 25),
      elevation: 5,
    );

    final ButtonStyle styleText = ElevatedButton.styleFrom(
      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );

    final args = ModalRoute.of(context)!.settings.arguments as EditAnuncioPageArguments;

    titleController.text = args.title;
    descriptionController.text = args.description;
    categoryController.text = args.category;
    stateController.text = args.state;
    phoneController.text = args.phone;
    priceController.text = args.price.toString();

    return Scaffold(
      appBar: AppBar(title: Text("Inserir Anuncio"),),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: titleController,
                        keyboardType: TextInputType.name,
                        onSaved: (newValue) => titleController.text = newValue!,
                        decoration: InputDecoration(
                          labelText: "Título do anúncio",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: descriptionController,
                        keyboardType: TextInputType.visiblePassword,
                        onSaved: (newValue) => descriptionController.text = newValue!,
                        decoration: InputDecoration(
                            labelText: "Descrição do anúncio",
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: categoryController,
                        keyboardType: TextInputType.text,
                        onSaved: (newValue) => categoryController.text = newValue!,
                        decoration: InputDecoration(
                            labelText: "Categoria do anúncio",
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: stateController,
                        keyboardType: TextInputType.text,
                        onSaved: (newValue) => stateController.text = newValue!,
                        decoration: InputDecoration(
                            labelText: "UF do anúncio",
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        onSaved: (newValue) => phoneController.text = newValue!,
                        decoration: InputDecoration(
                            labelText: "Contato",
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: priceController,
                        keyboardType: TextInputType.number,
                        onSaved: (newValue) => priceController.text = newValue!,
                        decoration: InputDecoration(
                            labelText: "Valor",
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  ],
                )
            ),
            ElevatedButton.icon(
                onPressed: () async {
                  var anuncioInfo = await _dbAnuncioController.retrieveAnuncio(args._anuncioId!);
                  var anuncio = anuncioInfo.elementAt(0);

                  anuncio.state = stateController.text;
                  anuncio.category = categoryController.text;
                  anuncio.title = titleController.text;
                  anuncio.price = double.parse(priceController.text);
                  anuncio.telephone = phoneController.text;
                  anuncio.description = descriptionController.text;

                  _dbAnuncioController.update(anuncio);
                  Navigator.pushNamed(
                      context,
                      ExtractMyAnunciosPageScreen.routeName
                  );
                },
                style: style,
                icon: Icon(Icons.add_circle),
                label: Text("Editar anúncio")
            ),
          ],
        ),
      ),
    );
  }
}

class EditAnuncioPageArguments {
  final int? _userId;
  final int? _anuncioId;
  final String title;
  final String description;
  final String category;
  final String state;
  final String phone;
  final double price;

  EditAnuncioPageArguments(
      this._userId,
      this._anuncioId,
      this.title,
      this.description,
      this.category,
      this.state,
      this.phone,
      this.price);
}
