// Projeto Desenvolvido por Natãn Trennepohl e Rafael Lisot

import 'package:ecolinky/pages/splash_page.dart';
import 'package:ecolinky/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

void main() {
  final FlutterI18nDelegate flutterDelegate = FlutterI18nDelegate(
      translationLoader: FileTranslationLoader(
          useCountryCode: false, fallbackFile: 'en', basePath: 'assets/i18n'));
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(flutterDelegate));
}

class MyApp extends StatelessWidget {
  final FlutterI18nDelegate flutterDelegate;
  MyApp(this.flutterDelegate);

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
      localizationsDelegates: [
        flutterDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('es'),
        const Locale('pt'),
      ],
    );
  }
}
