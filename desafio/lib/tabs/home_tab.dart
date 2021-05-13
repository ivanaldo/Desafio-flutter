import 'dart:convert';
import 'package:desafio/helper/dialogAmostra.dart';
import 'package:desafio/model/Dados.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _builderBodyBack() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 27, 84, 234),
            Color.fromARGB(255, 94, 143, 234)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
    );

    return Stack(
      children: [
        _builderBodyBack(),
        //GridViewHome(),
        CustomScrollView(
          slivers: [
            SliverAppBar(
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: Brightness.light,),
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Jogos"),
                centerTitle: true,
              ),
            ),
            FutureBuilder(
              future: DefaultAssetBundle
                  .of(context)
                  .loadString("load_json/dados.json"),
              builder: (context, snapshot){
                if(snapshot == null){
                return SliverToBoxAdapter(
                  child: Container(
                    height: 200.0,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  ),
                );
                }else{
                  var dadosJogo = json.decode(snapshot.data.toString());

                  return SliverGrid(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200.0,
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing: 1.0,
                      childAspectRatio: 1.0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return  GestureDetector(
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
                          child: SizedBox(
                            width: 120,
                            height: 120,
                            child: Image.asset("imagens/" + dadosJogo[index]['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                         );
                        },
                      childCount: dadosJogo == null ? 0 : dadosJogo.length,
                    ),
                  );
                }
              },
            )
          ],
        ),
      ],
    );
  }
}
