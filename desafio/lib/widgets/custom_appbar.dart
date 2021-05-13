import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key key}) : preferredSize = Size.fromHeight(60.0), super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>{

  List<String> itensMenu = [
    "Preço", "Popularidade", "Ordem alfabética"];

  _escolhaMenuItem(String itemEscolhido) {

    switch (itemEscolhido) {
      case "Preço":

        break;
      case "Popularidade":

        break;
      case "Ordem alfabética":

        break;
    }
  }



  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF1B54EA),
      title: Text('App Bar'),
      actions: <Widget>[
        PopupMenuButton<String>(
          onSelected: _escolhaMenuItem,
          itemBuilder: (context) {
            return itensMenu.map((String item) {
              return PopupMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList();
          },
        )
      ],
    );
  }
}