import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'Intro_Page.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
    );
  }

}


