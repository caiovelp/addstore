import 'package:addstore/controller/anuncioController.dart';
import 'package:addstore/helper/AnuncioDetalheHelper.dart';
import 'package:addstore/helper/meuAnuncioDetalheHelper.dart';
import 'package:addstore/model/anuncioModel.dart';
import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  TextEditingController stateController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final Anuncio anuncio;
  EditPage(this.anuncio, {super.key});

  saveEdit() {
    if(stateController.text.isNotEmpty) {
      anuncio.state = stateController.text;
    }
    if(categoryController.text.isNotEmpty) {
      anuncio.category = categoryController.text;
    }
    if(titleController.text.isNotEmpty) {
      anuncio.title = titleController.text;
    }
    if(priceController.text.isNotEmpty) {
      anuncio.price = double.parse(priceController.text);
    }
    if(telefoneController.text.isNotEmpty) {
      anuncio.telephone = telefoneController.text;
    }
    if(descriptionController.text.isNotEmpty) {
      anuncio.description = descriptionController.text;
    }

    AnuncioController().update(anuncio);
    (context) => MeuAnuncioDetalheHelper(anuncio);
  }

  @override
  Widget build(BuildContext context) {
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
                            labelText: anuncio.state,
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
                              labelText: anuncio.category,
                              border: OutlineInputBorder()
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: titleController,
                          keyboardType: TextInputType.visiblePassword,
                          onSaved: (newValue) => titleController.text = newValue!,
                          decoration: InputDecoration(
                              labelText: anuncio.title,
                              border: OutlineInputBorder()
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: priceController,
                          keyboardType: TextInputType.visiblePassword,
                          onSaved: (newValue) => priceController.text = newValue!,
                          decoration: InputDecoration(
                              labelText: anuncio.price.toString(),
                              border: OutlineInputBorder()
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: priceController,
                          keyboardType: TextInputType.visiblePassword,
                          onSaved: (newValue) => priceController.text = newValue!,
                          decoration: InputDecoration(
                              labelText: anuncio.telephone,
                              border: OutlineInputBorder()
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: priceController,
                          keyboardType: TextInputType.visiblePassword,
                          onSaved: (newValue) => priceController.text = newValue!,
                          decoration: InputDecoration(
                              labelText: anuncio.description,
                              border: OutlineInputBorder()
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                            AnuncioController().update(anuncio);
                          },
                          icon: Icon(Icons.login_rounded),
                          label: Text("Salvar")
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