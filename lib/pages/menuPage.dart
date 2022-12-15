import 'package:flutter/material.dart';

class ExtractMenuPageScreen extends StatelessWidget {
  const ExtractMenuPageScreen({Key? key}) : super(key: key);

  static const routeName = '/menu';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MenuPageArguments;

    if(args._loginStatus.toString() == "LoginStatus.signIn") {
      return Scaffold(
        appBar: AppBar(title: Text("Menu"),),
        body: MenuBodyLogged(),
      );
    }
    else {
      return Scaffold(
        appBar: AppBar(title: Text("Menu"),),
        body: MenuBodyUnLogged(),
      );
    }
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
                Navigator.pop(context);
                Navigator.pop(context);
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

class MenuBodyUnLogged extends StatelessWidget {
  MenuBodyUnLogged({Key? key}) : super(key: key);

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
                Navigator.pop(context);
                Navigator.pop(context);
              },
              style: style,
              icon: Icon(Icons.receipt_long_rounded),
              label: Text("Logar")
          ),
          ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pushNamed(context, '/cadastro');
              },
              style: style,
              icon: Icon(Icons.logout_rounded),
              label: Text("Cadastrar")
          ),
        ],
      ),
    );
  }
}

class MenuPageArguments {
  final String _loginStatus;

  MenuPageArguments(this._loginStatus);
}
