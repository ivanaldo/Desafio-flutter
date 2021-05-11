import 'package:desafio/screens/SplashScreen.dart';
import 'package:flutter/material.dart';

void main(){

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext contextP) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ("Desafio Flutter"),
      theme: ThemeData(
          accentColor: Color.fromARGB(255, 0, 0, 205),
          primaryColor: Color.fromARGB(255, 14, 14, 147)
      ),
      home: SplashScreen(),
    );
  }
}
