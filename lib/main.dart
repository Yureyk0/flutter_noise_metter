import 'package:flutter/material.dart';
import 'package:shum_app/screens/home.dart';
import 'package:shum_app/screens/info.dart';
import 'package:shum_app/screens/saves.dart';
import 'package:shum_app/screens/setting.dart';
import 'package:shum_app/services/all_route.dart';
import 'package:shum_app/services/inform_to_screens.dart';

void main() {
  runApp(const MyApp());
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
    InformToScreens informToScreens = InformToScreens(thisRoute, goToRoute);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Raleway',
      ),
      home: Navigator(
        pages: [
          MaterialPage(
            child: Home(informToScreens),
          ),
          if (thisRoute == AllRoutes.saves)
            MaterialPage(
              child: SavesPage(informToScreens),
            ),
          if (thisRoute == AllRoutes.info)
            MaterialPage(
              child: InfoPage(informToScreens),
            ),
          if (thisRoute == AllRoutes.setting)
            MaterialPage(
              child: SettingPage(informToScreens),
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
