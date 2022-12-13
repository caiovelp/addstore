import 'package:addstore/controller/anuncioController.dart';
import 'package:addstore/helper/AnuncioDetalheHelper.dart';
import 'package:addstore/model/anuncioModel.dart';
import 'package:flutter/material.dart';

class AnuncioPage extends StatefulWidget {
  const AnuncioPage({Key? key}) : super(key: key);

  @override
  State<AnuncioPage> createState() => _AnuncioPageState();
}

class _AnuncioPageState extends State<AnuncioPage> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final ScrollController _firstController = ScrollController();

    return Container(
        width: width,
        height: height,
        child: FutureBuilder<List<Anuncio>>(
          future: AnuncioController().getAnuncios(),
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
                                        builder: (context) => AnuncioDetalheHelper(
                                          snapshot.data!.iterator.current.title,
                                          snapshot.data!.iterator.current.price,
                                          snapshot.data!.iterator.current.telephone,
                                          snapshot.data!.iterator.current.description,
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
