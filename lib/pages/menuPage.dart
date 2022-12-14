import 'package:addstore/pages/menuPage.dart';
import 'package:addstore/pages/myAnuncios.dart';
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
    final args = ModalRoute.of(context)!.settings.arguments as MenuPageArguments;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(
                    context,
                    ExtractMyAnunciosPageScreen.routeName,
                    arguments: MyAnunciosPageArguments(
                        args._loginStatus,
                        args.userID,
                        args.state,
                        args.category,
                        args.title!,
                        args.price!));
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
  final String state;
  final String category;
  final String? title;
  final String? price;
  final int? userID;

  MenuPageArguments(
      this._loginStatus,
      this.userID,
      this.state,
      this.category,
      this.price,
      this.title);
}
