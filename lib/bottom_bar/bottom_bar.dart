import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shum_app/main.dart';
import 'package:shum_app/screens/home.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  String? thisRoute() => ModalRoute.of(context)?.settings.name;

  Color activeBtnColor(String route) {
    return route == thisRoute()
        ? const Color.fromARGB(255, 240, 236, 236)
        : Colors.transparent;
  }

  String? activeButtonNavigation(String route) {
    thisRoute() != route ? Navigator.of(context).pushNamed(route) : null;
  }

  bool? getIsRecording() {
    setState(() {});
    return context.findAncestorStateOfType<HomeState>()?.isRecording ?? false;
  }

  getOnStart() {
    return context.findAncestorStateOfType<HomeState>()?.start();
  }

  getOnStop() {
    return context.findAncestorStateOfType<HomeState>()?.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          color: activeBtnColor(AllRoutes.saves),
          child: InkWell(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            onTap: () {
              activeButtonNavigation(AllRoutes.saves);
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              height: 75,
              child: const Icon(
                Icons.save,
                size: 30,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Material(
          color: activeBtnColor(AllRoutes.home),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: InkWell(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            onTap: () async {
              activeButtonNavigation(AllRoutes.home);

              var status = await Permission.microphone.isDenied;
              if (thisRoute() == AllRoutes.home && status) {
                await Permission.microphone.request();
              }

              if (!getIsRecording()!) {
                getOnStart();
              } else if (getIsRecording()!) {
                getOnStop();
              }
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              height: 75,
              child: getIsRecording()!
                  ? const Icon(Icons.pause)
                  : const Icon(
                      Icons.mic,
                      size: 30,
                      color: Colors.green,
                    ),
            ),
          ),
        ),
        Material(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: InkWell(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            onTap: () {},
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              height: 75,
              child: const Icon(
                Icons.menu,
                size: 30,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Material(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: InkWell(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            onTap: () {},
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              height: 75,
              child: const Icon(
                Icons.timer_outlined,
                size: 30,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
