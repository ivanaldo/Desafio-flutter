import 'package:desafio/model/Dados.dart';
import 'package:desafio/tabs/compras_tab.dart';
import 'package:flutter/material.dart';

class Compras extends StatelessWidget {

  final Dados dados;
  Compras(this.dados);

  @override
  Widget build(BuildContext context) {
    return ComprasTab(dados);
  }
}
