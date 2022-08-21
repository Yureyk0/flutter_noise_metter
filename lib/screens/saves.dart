import 'package:flutter/material.dart';

import '../bottom_bar/bottom_bar.dart';

class SavesPage extends StatelessWidget {
  const SavesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Saves'),
      bottomNavigationBar: BottomBar(),
    );
  }
}
