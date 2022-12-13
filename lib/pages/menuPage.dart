import 'package:flutter/material.dart';



class MenuLogged extends StatefulWidget {
  const MenuLogged({Key? key}) : super(key: key);

  @override
  State<MenuLogged> createState() => _MenuLoggedState();
}

class _MenuLoggedState extends State<MenuLogged> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu"),),
      body: MenuBodyLogged(),
    );
  }
}


class MenuBodyLogged extends StatelessWidget {
  MenuBodyLogged({Key? key}) : super(key: key);

  @override
  final ButtonStyle style = ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: 40),
    elevation: 5,
  );

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
              onPressed: () {

              },
              style: style,
              icon: Icon(Icons.receipt_long_rounded),
              label: Text("Meus anúncios")
          ),
          ElevatedButton.icon(
              onPressed: () {

              },
              style: style,
              icon: Icon(Icons.logout_rounded),
              label: Text("Deslogar")
          ),
        ],
      ),
    );
  }
}