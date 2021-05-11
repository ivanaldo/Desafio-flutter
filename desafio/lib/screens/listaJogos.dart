import 'dart:async';

import 'package:desafio/model/Dados.dart';
import 'package:desafio/widgets/ItemAnuncio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ListaJogos extends StatefulWidget {
  @override
  _ListaJogosState createState() => _ListaJogosState();
}

class _ListaJogosState extends State<ListaJogos> {

  final _controller = Dados();
  
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    
    var carregandoDados = Center(
      child: Column(children: <Widget>[
        Text("Carregando anúncios"),
        CircularProgressIndicator()
      ],),
    );
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus Anúncios"),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.pushNamed(context, "/novo-anuncio");
        },
      ),
      body: StreamBuilder(
        stream: _controller,
        builder: (context, snapshot){
          
          switch( snapshot.connectionState ){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return carregandoDados;
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              
              //Exibe mensagem de erro
              if(snapshot.hasError)
                return Text("Erro ao carregar os dados!");
              
              QuerySnapshot querySnapshot = snapshot.data;

              return ListView.builder(
                  itemCount: querySnapshot.documents.length,
                  itemBuilder: (_, indice){
                    
                    List<DocumentSnapshot> anuncios = querySnapshot.documents.toList();
                    DocumentSnapshot documentSnapshot = anuncios[indice];
                    Anuncio anuncio = Anuncio.fromDocumentSnapshot(documentSnapshot);
                    
                    return ItemJogos(
                      dados: anuncio,
                      onTapItem: (){
                       // _decisaoClasse(classeModel.nome, classeModel.email, classeModel.senha);
                      },
                    );
                  }
              );

          }

          return Container();

        },
      ),
    );
  }
}
