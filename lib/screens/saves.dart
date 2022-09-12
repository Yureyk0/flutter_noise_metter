import 'package:flutter/material.dart';
import 'package:shum_app/services/inform_to_screens.dart';

import '../bottom_bar/bottom_bar.dart';

class SavesPage extends StatelessWidget {
  final InformToScreens informToScreens;
  const SavesPage(this.informToScreens,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text('Saves'),
      bottomNavigationBar: BottomBar(informToScreens),
    );
  }
}
