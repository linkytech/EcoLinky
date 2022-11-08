// Projeto Desenvolvido por Natãn Trennepohl e Rafael Lisot

import 'package:flutter/material.dart';
import 'package:ecolinky/pages/initial_page.dart';
import 'package:ecolinky/pages/login_page.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const InitialPage(),
    );
  }
}