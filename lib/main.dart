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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String thisRoute = AllRoutes.home;
  bool is404 = false;

  void goToRoute(String route) {
    setState(() {
      thisRoute = route;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Raleway',
      ),
      home: Navigator(
        pages: [
          MaterialPage(
            child: Home(
              goToRoute: goToRoute,
            ),
          ),
          if (thisRoute == AllRoutes.saves)
            MaterialPage(
              child: SavesPage(
                goToRoute: goToRoute,
              ),
            ),
          if (thisRoute == AllRoutes.info)
            MaterialPage(
              child: InfoPage(
                goToRoute: goToRoute,
              ),
            ),
          if (thisRoute == AllRoutes.setting)
            MaterialPage(
              child: SettingPage(
                goToRoute: goToRoute,
              ),
            ),
          if (is404)
            const MaterialPage(
              child: Scaffold(
                body: Center(
                  child: Text('404'),
                ),
              ),
            ),
        ],
        onPopPage: ((route, result) {
          if (!route.didPop(result)) {
            return false;
          }

          return route.didPop(result);
        }),
      ),
    );
  }
}
