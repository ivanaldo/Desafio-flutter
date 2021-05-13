import 'package:desafio/database/bancoDados.dart';
import 'package:desafio/model/Anotacao.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CarrinhoTab extends StatefulWidget {
  const CarrinhoTab({Key key}) : super(key: key);

  @override
  _CarrinhoTabState createState() => _CarrinhoTabState();
}

List<Anotacao> _compras = [];
double subtotal = 0;
double frete = 0;
double total = 0;
NumberFormat formatter = NumberFormat("0.00");

class _CarrinhoTabState extends State<CarrinhoTab> {

    @override
  void initState() {
    super.initState();
    _recuperaCompras();
  }

  var _db = AnotacaoHelper();

   _recuperaCompras() async {

     List anotacoesRecuperadas = await _db.recuperarCompra();

     List<Anotacao> listaTemporaria = [];
     for( var item in anotacoesRecuperadas ){

       Anotacao anotacao = Anotacao.fromMap( item );
       listaTemporaria.add( anotacao );

     }

     setState(() {
       _compras = listaTemporaria;
     });

     listaTemporaria = null;
     totalCompras();
    }

     totalCompras() {
     subtotal = 0;
     frete = 0;
     total = 0;

     for(int i = 0; i < _compras.length; i++){
        setState(() {
          subtotal += double.parse(_compras[i].price);
        });
     }
     if(subtotal >= 250.00){
       frete = 0;
     }else{
       frete += (_compras.length*10);
     }

     total = (subtotal + frete);
    }

    _alertaDelete(int id) {

      Widget cancelButton = TextButton(
        child: Text("Sim", style: TextStyle(color: Colors.blue),),
        onPressed: () {
             _db.removerCompra( id );
             _recuperaCompras();
             Navigator.of(context).pop();
        },
      );

      Widget continueButton = TextButton(
        child: Text("Não", style: TextStyle(color: Colors.blue)),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Atenção"),
        content: Text("Tem certeza que deseja apagar essa compra?"),
        actions: [
          cancelButton,
          continueButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Expanded(
               child: ListView.builder(
                   shrinkWrap: true,
                   padding: const EdgeInsets.all(8),
                   itemCount: _compras.length,
                   itemBuilder: (BuildContext context, int index) {
                     return Card(
                       child: Padding(
                         padding: EdgeInsets.all(12),
                         child: Row(children: <Widget>[
                           SizedBox(
                             width: 120,
                             height: 120,
                             child: Image.asset("imagens/" + _compras[index].image,
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
                                     "" + _compras[index].name,
                                     style: TextStyle(
                                         fontSize: 18,
                                         fontWeight: FontWeight.bold
                                     ),
                                   ),
                                   Text("R\$ ${_compras[index].price} "),
                                   Text("Pontuação ${_compras[index].score} "),
                                 ],),
                             ),
                           ),
                           Expanded(
                             flex: 1,
                             child: TextButton(
                               style: TextButton.styleFrom(
                                 padding: EdgeInsets.all(8),

                               ),
                               onPressed: (){
                                 _alertaDelete(_compras[index].id);
                               },
                               child: Icon(Icons.delete, color: Colors.red,),
                             ),
                           )
                         ],
                         ),
                       ),
                     );
                   }
               ),
           ),
           Container(
             alignment: Alignment.bottomRight,
             padding: EdgeInsets.only(top: 8, bottom: 8),
             margin: const EdgeInsets.only(left: 16),
             child: Row(
               children: [
                 Expanded(
                     child:Text("Total de itens", style: TextStyle(fontSize: 20)
                     )
                 ),
                 Expanded(
                     child:Text("${_compras.length}", style: TextStyle(fontSize: 20)
                     )
                 ),
               ],
             ),
           ),
           Container(
             padding: EdgeInsets.only(top: 8, bottom: 8),
             margin: const EdgeInsets.only(left: 16),
             child: Row(
               children: [
                 Expanded(
                     child:Text("Subtotal", style: TextStyle(fontSize: 20)
                     )
                 ),
                 Expanded(

                     child:  Text("" + formatter.format(subtotal) , style: TextStyle(fontSize: 20)
                     )
                 ),
               ],
             ),
           ),
           Container(
             padding: EdgeInsets.only(top: 8, bottom: 8),
             margin: const EdgeInsets.only(left: 16),
             child: Row(
               children: [
                 Expanded(
                     child:Text("Frete", style: TextStyle(fontSize: 20)
                     )
                 ),
                 Expanded(

                     child:  Text("" + formatter.format(frete) , style: TextStyle(fontSize: 20)
                     )
                 ),
               ],
             ),
           ),
           Container(
             padding: EdgeInsets.only(top: 8, bottom: 8),
             margin: const EdgeInsets.only(left: 16),
             child: Row(
               children: [
                 Expanded(
                     child:Text("Total", style: TextStyle(fontSize: 20)
                     )
                 ),
                 Expanded(

                     child:  Text("" + formatter.format(total), style: TextStyle(fontSize: 20)
                     )
                 ),
               ],
             ),
           ),
           Padding(
             padding: EdgeInsets.only(top: 8, bottom: 16),
             child: ElevatedButton(
               child: Text("Finalizar Compra",
                 style: TextStyle(fontSize: 20,
                   color: Colors.white,
                 ),
               ),
               style: ElevatedButton.styleFrom(
                   padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                   primary: Color(0xFF1B54EA)
               ),
               onPressed: (){

               },
             ),
           )
         ],
       ),
      ),
    );
  }
}
