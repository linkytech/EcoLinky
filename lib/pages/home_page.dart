import 'package:ecolinky/pages/profile_page.dart';
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
  int _selection = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700],
        title: Text('EcoLinky'),
      ),
      body: IndexedStack(
        index: _selection,
        children: <Widget>[
          HomeExplorer(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.greenAccent[700],
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        currentIndex: _selection,
        onTap: (option) {
          setState(
            () {
              _selection = option;
            },
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: FlutterI18n.translate(context, "home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: FlutterI18n.translate(context, "profile"),
          ),
        ],
      ),
    );
  }
}

class HomeExplorer extends StatefulWidget {
  const HomeExplorer({Key? key}) : super(key: key);

  @override
  State<HomeExplorer> createState() => _HomeExplorerState();
}

class _HomeExplorerState extends State<HomeExplorer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Explore(),
        ),
      ],
    );
  }
}
