import 'package:flutter/material.dart';

import '../bottom_bar/bottom_bar.dart';

class SavesPage extends StatelessWidget {
  final Function goToRoute;
  const SavesPage({Key? key, required this.goToRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text('Saves'),
      bottomNavigationBar: BottomBar(goToRoute),
    );
  }
}
