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
            )
          ],
        )
      ],
    );
  }
}
