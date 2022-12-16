// ignore_for_file: prefer_const_constructors

import 'package:addstore/controller/anuncioController.dart';
import 'package:addstore/helper/AnuncioDetalheHelper.dart';
import 'package:addstore/helper/CustomWidgets.dart';
import 'package:addstore/model/anuncioModel.dart';
import 'package:addstore/pages/editAnuncio.dart';
import 'package:addstore/pages/insertAnuncio.dart';
import 'package:addstore/pages/menuPage.dart';
import 'package:addstore/pages/myAnuncios.dart';
import 'package:flutter/material.dart';

class ExtractMyAnunciosPageScreen extends StatelessWidget {
  const ExtractMyAnunciosPageScreen({Key? key}) : super(key: key);

  static const routeName = '/myAnuncios';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meus anúncios"),),
      body: MyAnuncioPageBody()
    );
  }
}

class MyAnuncioPageBody extends StatelessWidget {
  MyAnuncioPageBody({Key? key}) : super(key: key);

  var _dbAnuncioController = AnuncioController();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoriaController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final ScrollController _firstController = ScrollController();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final TextStyle titleStyle = TextStyle(
      fontSize: width * 0.07,
      fontWeight: FontWeight.bold,
    );

    final TextStyle subTitleStyle = TextStyle(
      fontSize: width * 0.04,
      fontStyle: FontStyle.italic,
    );

    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: TextStyle(fontSize: 25),
      elevation: 5,
    );

    final args = ModalRoute.of(context)!.settings.arguments as MyAnunciosPageArguments;

    return Column(
      children: [
        ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(
                  context,
                  InsertAnuncioPage.routeName,
                  arguments: InsertAnuncioPageArguments(args._userId)
              );
            },
            style: style,
            icon: Icon(Icons.add_circle),
            label: Text("Inserir anúncio")
        ),
        Expanded(
            child: FutureBuilder<List<Anuncio>>(
              future: _dbAnuncioController.getAnunciosByID(
                  args._userId!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Scrollbar(
                      thumbVisibility: true,
                      controller: _firstController,
                      child: Column(
                        children: [
                          Expanded(
                              child: ListView.builder(
                                  controller: _firstController,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.02, vertical: height * 0.02),
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    final item = snapshot.data![index];
                                    return Dismissible(
                                        background: swapRightBackground(),
                                        secondaryBackground: swapLeftBackground(),
                                        key: UniqueKey(),
                                        onDismissed: (DismissDirection direction) {
                                            if (direction == DismissDirection.endToStart) {
                                              _dbAnuncioController.delete(item.id!);
                                            }
                                            else {
                                              Navigator.pushNamed(
                                                  context,
                                                  EditAnuncioPage.routeName,
                                                  arguments: EditAnuncioPageArguments(
                                                      args._userId,
                                                      item.id,
                                                      item.title,
                                                      item.description,
                                                      item.category,
                                                      item.state,
                                                      item.telephone,
                                                      item.price)
                                              );
                                            }
                                        },
                                        child: Card(
                                          child: ListTile(
                                            trailing: Icon(Icons.play_arrow, size: height * 0.02),
                                            title: Text(item.title, style: titleStyle),
                                            subtitle: Text("R\$ ${item.price} - Estado: ${item.state} - Categoria ${item.category}", style: subTitleStyle,),
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => AnuncioDetalheHelper(
                                                          item
                                                      )
                                                  )
                                              );
                                            },
                                          ),
                                        )
                                    );
                                  }
                              )
                          )
                        ],
                      )
                  );
                }
                else {
                  return const CircularProgressIndicator();
                }
              },
            )
        )
      ],
    );
  }
}


class MyAnunciosPageArguments {
  final String _loginStatus;
  final String state;
  final String category;
  final String title;
  final String price;
  final int? _userId;

  MyAnunciosPageArguments(
      this._loginStatus,
      this._userId,
      this.state,
      this.category,
      this.title,
      this.price);
}
