import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:math' as math;

class InfoPage extends StatelessWidget {
  final Function goToRoute;
  const InfoPage({Key? key, required this.goToRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SwitchProvider>(
      create: (_) => SwitchProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<SwitchProvider>(builder: (context, value, child) {
            return Text(
              'TEST PROVIDER',
              style: TextStyle(
                  color: value.getRandomColor, fontWeight: FontWeight.bold),
            );
          }),
        ),
        body: SafeArea(
          child: BodyContent(),
        ),
      ),
    );
  }
}

class BodyContent extends StatelessWidget {
  BodyContent({Key? key}) : super(key: key);

  bool isSwiched = false;

  @override
  Widget build(BuildContext context) {
    SwitchProvider state = Provider.of<SwitchProvider>(context);
    return Center(
      child: Column(
        children: [
          AnimatedContainer(
            width: 100,
            height: 100,
            color: state.getRandomColor,
            duration: const Duration(seconds: 2),
          ),
          Switch(
              value: state.counterValue,
              onChanged: (value) {
                state._switch();
                state._ramdomColorMetod();
              })
        ],
      ),
    );
  }
}

class SwitchProvider extends ChangeNotifier {
  bool isSwiched = false;
  bool get counterValue => isSwiched;

  Color randomColor = const Color.fromRGBO(244, 67, 54, 1);
  Color get getRandomColor => randomColor;
  void _switch() {
    isSwiched = !isSwiched;
    notifyListeners();
  }

  void _ramdomColorMetod() {
    randomColor =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    notifyListeners();
  }

  // void _incrementCount() {
  //   _count++;
  //   notifyListeners();
  // }

  // void _decrementCount() {
  //   _count--;
  //   notifyListeners();
  // }
}
