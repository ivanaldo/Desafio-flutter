import 'package:desafio/model/Dados.dart';
import 'package:flutter/material.dart';

class ItemJogos extends StatelessWidget {

  Dados dados;
  VoidCallback onTapItem;
  VoidCallback onPressedRemover;

  ItemJogos({
    @required this.dados,
    this.onTapItem,
    this.onPressedRemover
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTapItem,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(children: <Widget>[

            SizedBox(
              width: 120,
              height: 120,
              child: Image.network(
                dados.image,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Text(
                    dados.nome,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text("R\$ ${dados.price} "),
                    Text("Pontuação ${dados.score} "),
                ],
                ),
              ),
            ),
          ],
          ),
        ),
      ),
    );
  }
}
