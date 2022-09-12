import 'dart:async';

import 'package:flutter/material.dart';
import 'package:noise_meter/noise_meter.dart';
import 'package:shum_app/main.dart';
import 'package:shum_app/services/all_route.dart';
import 'package:shum_app/services/inform_to_screens.dart';

import '../bottom_bar/bottom_bar.dart';

class Home extends StatefulWidget {
  final InformToScreens informToScreens;
  const Home(this.informToScreens, {Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  bool isRecording = false;
  StreamSubscription<NoiseReading>? noiseSubscription;
  late NoiseMeter noiseMeter;
  double thisCurrencyNoise = 0.0;

  @override
  void initState() {
    super.initState();
    noiseMeter = NoiseMeter(onError);
  }

  @override
  void dispose() {
    noiseSubscription?.cancel();
    super.dispose();
  }

  void onData(NoiseReading noiseReading) {
    setState(() {
      if (!isRecording) {
        isRecording = true;
      }
    });

    thisCurrencyNoise = noiseReading.maxDecibel;
  }

  void onError(Object error) {
    print(error.toString());
    isRecording = false;
  }

  void start() async {
    try {
      noiseSubscription = noiseMeter.noiseStream.listen(onData);
    } catch (err) {
      print(err);
    }
    isRecording = true;
  }

  void stop() async {
    try {
      if (noiseSubscription != null) {
        noiseSubscription!.cancel();
        noiseSubscription = null;
      }
      setState(() {
        isRecording = false;
      });
    } catch (err) {
      print('stopRecorder error: $err');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(widget.informToScreens),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.info_outline,
                        color: Colors.grey,
                        size: 34,
                      ),
                    ),
                    onTap: () {
                      widget.informToScreens.goToRoute(AllRoutes.info);
                    },
                    borderRadius: BorderRadius.circular(50),
                  ),
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: const Icon(
                        Icons.settings,
                        color: Colors.grey,
                        size: 34,
                      ),
                    ),
                    onTap: () {
                      widget.informToScreens.goToRoute(AllRoutes.setting);
                    },
                    borderRadius: BorderRadius.circular(50),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.red,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      thisCurrencyNoise.toStringAsFixed(1),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 80,
                          color: Color.fromARGB(221, 34, 34, 34)),
                    ),
                    Container(
                      width: 1,
                      height: 70,
                      color: Color.fromARGB(255, 179, 175, 175),
                    ),
                    Column(
                      children: [
                        const Text(
                          'Min 11.2',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Min 11.2',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
