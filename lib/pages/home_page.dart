import 'package:flutter/material.dart';
import 'package:ecolinky/Models/user_model.dart';
import 'package:ecolinky/components/explore.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class HomePage extends StatefulWidget {
  final User? user;

  const HomePage({Key? key, this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EcoLinky'),
      ),
      body: Column(
        children: [
          Flexible(
            child: Explore(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: FlutterI18n.translate(context, "home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: FlutterI18n.translate(context, "profile"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: FlutterI18n.translate(context, "exit"),
          ),
        ],
      ),
    );
  }
}
