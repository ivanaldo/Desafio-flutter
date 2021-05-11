import 'package:desafio/tiles/drawer_tile.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  //const CustomDrawer({Key key}) : super(key: key);

  final PageController pageController;


  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {

    Widget _builderDrawerBack() => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 59, 109, 239),
                Colors.white
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          )
      ),
    );

    return Drawer(
      child: Stack(
        children: [
          _builderDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: [
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text("Desafio\nFlutter",
                      style: TextStyle(
                        fontSize: 44.0, fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                        bottom: 0.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Bem vindo!",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                          GestureDetector(
                            onTap: (){

                            },
                            child: Text("Entre ou cadastre-se",
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                        ),
                    ),
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, "Home", pageController, 0),
              DrawerTile(Icons.perm_identity, "Perfil", pageController, 1),
              DrawerTile(Icons.whatshot, "Produtos", pageController, 2),
              DrawerTile(Icons.add_shopping_cart, "Carrinho", pageController, 3),
              DrawerTile(Icons.cancel, "Sair", pageController, 4),
            ],
          )
        ],
      ),
    );
  }
}
