import 'dart:convert';
import 'package:desafio/helper/dialogAmostra.dart';
import 'package:desafio/model/Dados.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProdutosTab extends StatefulWidget {
  const ProdutosTab({Key key}) : super(key: key);

  @override
  _ProdutosTabState createState() => _ProdutosTabState();
}

class _ProdutosTabState extends State<ProdutosTab> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle
                .of(context)
                .loadString("load_json/dados.json"),
            builder: (context, snapshot){

              var dadosJogo = json.decode(snapshot.data.toString()) ;


              return ListView.builder(
                itemBuilder: (BuildContext context, int index){

                  return GestureDetector(
                    onTap: (){
                      Dados dado = Dados();
                      dado.id = dadosJogo[index]['id'];
                      dado.name = dadosJogo[index]['name'];
                      dado.price = dadosJogo[index]['price'];
                      dado.score = dadosJogo[index]['score'];
                      dado.image = dadosJogo[index]['image'];
                      DialogAmostra amostra = DialogAmostra();
                      amostra.abrirDialog(context, dado);
                    },
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Row(children: <Widget>[

                          SizedBox(
                            width: 120,
                            height: 120,
                            child: Image.asset("imagens/" + dadosJogo[index]['image'],
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
                                    "" + dadosJogo[index]['name'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text("R\$ ${dadosJogo[index]['price']} "),
                                  Text("Pontuação ${dadosJogo[index]['score']} "),
                                ],),
                             ),
                           ),
                         ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: dadosJogo == null ? 0 : dadosJogo.length,
              );
            },
          ),
        ),
      ),
    );
  }
}

