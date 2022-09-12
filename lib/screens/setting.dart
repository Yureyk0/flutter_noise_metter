import 'package:flutter/material.dart';
import 'package:shum_app/services/inform_to_screens.dart';

class SettingPage extends StatelessWidget {
  final InformToScreens informToScreens;
  const SettingPage(this.informToScreens, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Setting Page'),
    );
  }
}
