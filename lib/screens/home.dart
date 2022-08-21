import 'package:flutter/material.dart';

import '../bottom_bar/bottom_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBar(),
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
                      Navigator.of(context).pushNamed('/info');
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
                      Navigator.of(context).pushNamed('/setting');
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
                  color: Colors.red,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      '22.3',
                      style: TextStyle(
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
