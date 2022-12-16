import 'package:flutter/material.dart';

class AnuncioTile extends StatelessWidget {
  final String info;
  final Color tileColor;

  AnuncioTile(this.info, this.tileColor);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: tileColor,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: height * 0.02, horizontal: width * 0.04),
        width: width * 0.45,
        height: height * 0.13,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              info,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: height * 0.025
              ),
            ),
          ],
        ),
      ),
    );
  }
}