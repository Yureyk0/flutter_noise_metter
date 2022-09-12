import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  final Function goToRoute;
  const SettingPage({Key? key, required this.goToRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Setting Page'),
    );
  }
}
