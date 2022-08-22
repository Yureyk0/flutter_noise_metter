import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shum_app/main.dart';
import 'package:shum_app/screens/home.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? thisRoute() => ModalRoute.of(context)?.settings.name;

    Color activeBtnColor(String route) {
      return route == thisRoute()
          ? const Color.fromARGB(255, 240, 236, 236)
          : Colors.transparent;
    }

    bool? getIsRecording() =>
        context.findAncestorStateOfType<HomeState>()?.isRecording;
    getOnStart() {
      return context.findAncestorStateOfType<HomeState>()?.start();
    }

    getOnStop() {
      return context.findAncestorStateOfType<HomeState>()?.stop();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          color: activeBtnColor(AllRoutes.saves),
          child: InkWell(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            onTap: () {
              thisRoute() != AllRoutes.saves
                  ? Navigator.of(context).pushNamed(AllRoutes.saves)
                  : null;
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              height: 75,
              child: Icon(
                Icons.save,
                size: 30,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Material(
          color: activeBtnColor(AllRoutes.home),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          child: InkWell(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            onTap: () async {
              thisRoute() != AllRoutes.home
                  ? Navigator.of(context).pushNamed(AllRoutes.home)
                  : null;

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
              child: Icon(
                Icons.mic,
                size: 30,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Material(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          child: InkWell(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            onTap: () {},
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              height: 75,
              child: Icon(
                Icons.menu,
                size: 30,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Material(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          child: InkWell(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            onTap: () {},
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              height: 75,
              child: Icon(
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
