import 'package:desafio/model/Dados.dart';
import 'package:desafio/screens/compras.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogAmostra{

  abrirDialog(BuildContext context, Dados dadosJogo){

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: 320,
                  height: 320,
                  child: Image.asset("imagens/" + dadosJogo.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Text("R\$ ${dadosJogo.price} "),
                Text("Pontuação ${dadosJogo.score} "),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Compras(dadosJogo)));
                        },
                        child: Text("Comprar"),
                      ),
                      ),
                      Expanded(
                        child: TextButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: Text("Voltar"),
                      ),)

                    ],
                  ),
                )

              ],
            ),
          );
        }
    );
  }
}