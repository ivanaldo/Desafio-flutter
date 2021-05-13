import 'package:desafio/database/bancoDados.dart';
import 'package:desafio/model/Anotacao.dart';
import 'package:desafio/model/Dados.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ComprasTab extends StatefulWidget {

  final Dados dadosCompra;
   ComprasTab(this.dadosCompra);

  @override
  _ComprasTabState createState() => _ComprasTabState();
}

var _db = AnotacaoHelper();

class _ComprasTabState extends State<ComprasTab> {

 Future _salvarCompra( Anotacao anotacaoSelecionada ) async {

       await _db.salvarCompra( anotacaoSelecionada );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seu pedido"),
        backgroundColor: Color(0xFF1B54EA),
        centerTitle: true,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: Brightness.light,),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(children: <Widget>[

                        SizedBox(
                          width: 150,
                          height: 150,
                          child: Image.asset("imagens/" + widget.dadosCompra.image,
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
                                  "" + widget.dadosCompra.name,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text("R\$ ${widget.dadosCompra.price} "),
                                Text("Pontuação ${widget.dadosCompra.score} "),
                              ],),
                          ),
                        ),
                      ],
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: Text("Resumo do Pedido",
                  style: TextStyle(
                    fontSize: 20
                  ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        Text("${widget.dadosCompra.name}", style: TextStyle(fontSize: 20)
                        ),
                      ],
                    )
                ),
                Divider(),
                Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        Expanded(
                            child:Text("Valor", style: TextStyle(fontSize: 20)
                            )
                        ),
                        Expanded(
                            child:  Text("R\$ ${widget.dadosCompra.price}", style: TextStyle(fontSize: 20)
                            )
                        ),
                      ],
                    )
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  alignment: Alignment.bottomRight,
                  child: Row(
                    children: [
                      Expanded(
                          child:Text("Pontuação", style: TextStyle(fontSize: 20)
                          )
                      ),
                      Expanded(

                          child:  Text("${widget.dadosCompra.score}", style: TextStyle(fontSize: 20)
                          )
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: ElevatedButton(
                    child: Text("Adicionar ao carrinho",
                      style: TextStyle(fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      primary: Color(0xFF1B54EA)
                    ),
                    onPressed: (){

                      String id = widget.dadosCompra.id.toString() ;
                      String name = widget.dadosCompra.name;
                      String price = widget.dadosCompra.price.toString();
                      String score = widget.dadosCompra.score.toString();
                      String image = widget.dadosCompra.image;

                      Anotacao anotacao = Anotacao(id, name, price, score, image);
                      _salvarCompra(anotacao);

                      Navigator.of(context).pop();

                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
