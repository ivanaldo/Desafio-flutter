import 'package:desafio/tabs/carrinho_tab.dart';
import 'package:desafio/tabs/home_tab.dart';
import 'package:desafio/tabs/perfil_tab.dart';
import 'package:desafio/tabs/produtos_tab.dart';
import 'package:desafio/widgets/custom_appbar.dart';
import 'package:desafio/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class HomeScreen extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
            body: HomeTab(),
          drawer: CustomDrawer(_pageController)
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF1B54EA),
            title: Text("Perfil"),
            centerTitle: true,
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: Brightness.light,),
          ),
          drawer: CustomDrawer(_pageController),
          body: PerfilTab(),
        ),
        Scaffold(
          appBar: CustomAppBar(),
          drawer: CustomDrawer(_pageController),
          body: ProdutosTab(),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF1B54EA),
            title: Text("Carrinho"),
            centerTitle: true,
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: Brightness.light,),
          ),
          drawer: CustomDrawer(_pageController),
          body: CarrinhoTab(),
        ),

      ],
    );
  }
}
