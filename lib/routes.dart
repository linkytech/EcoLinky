import 'package:ecolinky/pages/home_page.dart';
import 'package:ecolinky/pages/initial_page.dart';
import 'package:ecolinky/pages/login_page.dart';
import 'package:flutter/material.dart';

final routes = {
  '/login': (BuildContext context) => LoginPage(),
  '/home': (BuildContext context) => HomePage(),
  '/initial': (BuildContext context) => InitialPage(),
};
