// Projeto Desenvolvido por Natãn Trennepohl e Rafael Lisot

import 'package:ecolinky/pages/splash_page.dart';
import 'package:ecolinky/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EcoLinky',
      routes: routes,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashPage(),
    );
  }
}
