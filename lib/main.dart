import 'package:flutter/material.dart';
import 'package:shum_app/screens/home.dart';
import 'package:shum_app/screens/info.dart';
import 'package:shum_app/screens/saves.dart';
import 'package:shum_app/screens/setting.dart';

void main() {
  runApp(const MyApp());
}

class AllRoutes {
  static const String home = '/';
  static const String info = '/info';
  static const String setting = '/setting';
  static const String saves = '/saves';
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Raleway',
      ),
      routes: {
        AllRoutes.home: (context) => const Home(),
        AllRoutes.info: (context) => const InfoPage(),
        AllRoutes.setting: (context) => const SettingPage(),
        AllRoutes.saves: (context) => const SavesPage(),
      },
      initialRoute: '/',
    );
  }
}
