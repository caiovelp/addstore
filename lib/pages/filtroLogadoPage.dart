import 'package:flutter/material.dart';

class FiltroLogadoPage extends StatelessWidget {
  TextEditingController stateController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  FiltroLogadoPage({super.key});

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
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: titleController,
                          keyboardType: TextInputType.visiblePassword,
                          onSaved: (newValue) => titleController.text = newValue!,
                          decoration: InputDecoration(
                              labelText: "Filtrar pelo nome do produto",
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
                              labelText: "Filtrar pelo preço do produto",
                              border: OutlineInputBorder()
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                              // Navigator.pushNamed(context, )
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