import 'package:addstore/controller/anuncioController.dart';
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

    return Scaffold(
      appBar: AppBar(title: Text(''),),
      body: Container(
        width: width,
        height: height,
        child: FutureBuilder<List<Anuncio>>(
          future: AnuncioController().getEstadosByData(dataBruta!),
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
                        itemCount: snapshot.data!.estados.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              trailing: Icon(Icons.play_arrow, size: height * 0.02),
                              title: Text(snapshot.data!.estados[index].nome),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PaisesStats(
                                          snapshot.data!.estados[index].nome,
                                          snapshot.data!.estados[index].casos,
                                          snapshot.data!.estados[index].suspeitos,
                                          snapshot.data!.estados[index].mortes,
                                          snapshot.data!.estados[index].recusados,
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
      ),
    );
  }
}
