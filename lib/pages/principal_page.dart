import 'package:flutter/material.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({super.key});

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Página Principal')),
      body: Container(
        child: Column(
          children: [
            Image.asset("assets/icons/icon.png", width: 300, height: 200),
            Text('Texto bem Legal')
          ],
        ),
      ),
      drawer: const Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_rounded), label: ('teste')),
          const BottomNavigationBarItem(
              icon: Icon(Icons.zoom_out), label: ('teste')),
        ],
      ),
    );
  }
}
