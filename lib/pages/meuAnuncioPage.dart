import 'package:addstore/controller/anuncioController.dart';
import 'package:addstore/helper/AnuncioDetalheHelper.dart';
import 'package:addstore/helper/meuAnuncioDetalheHelper.dart';
import 'package:addstore/model/anuncioModel.dart';
import 'package:flutter/material.dart';

class MeuAnuncioPage extends StatefulWidget {
  const MeuAnuncioPage({Key? key}) : super(key: key);

  @override
  State<MeuAnuncioPage> createState() => _MeuAnuncioPageState();
}

class _MeuAnuncioPageState extends State<MeuAnuncioPage> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final ScrollController _firstController = ScrollController();

    return Container(
      width: width,
      height: height,
      child: FutureBuilder<List<Anuncio>>(
        future: AnuncioController().getMeusAnuncios(/*TODO: captar usuário logado*/),
        builder: (context,snapshot) {
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
                        return Card(
                          child: ListTile(
                            trailing: Icon(Icons.play_arrow, size: height * 0.02),
                            title: Text(snapshot.data!.iterator.current.title),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MeuAnuncioDetalheHelper(
                                        snapshot.data!.iterator.current
                                        // snapshot.data!.iterator.current.photo,
                                      )
                                  )
                              );
                            },
                          ),
                        );
                      },
                    ),)
                ],
              ),
            );
          }
          else if(snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
