import 'package:flutter/material.dart';
import 'package:shum_app/screens/home.dart';
import 'package:shum_app/screens/info.dart';
import 'package:shum_app/screens/saves.dart';
import 'package:shum_app/screens/setting.dart';

void main() {
  runApp(const MyApp());
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
        '/': (context) => const Home(),
        '/info': (context) => const InfoPage(),
        '/setting': (context) => const SettingPage(),
        '/saves': (context) => const SavesPage(),
      },
      initialRoute: '/',
    );
  }
}
