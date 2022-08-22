import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itRoute = ModalRoute.of(context)?.settings.name;

    ifActiveSavesBtn() {
      return itRoute == '/saves'
          ? const Color.fromARGB(255, 240, 236, 236)
          : Colors.transparent;
    }

    ifActiveHomeBtn() {
      return itRoute == '/'
          ? const Color.fromARGB(255, 240, 236, 236)
          : Colors.transparent;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          color: ifActiveSavesBtn(),
          child: InkWell(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            onTap: () {
              itRoute != '/saves'
                  ? Navigator.of(context).pushNamed('/saves')
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
          color: ifActiveHomeBtn(),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          child: InkWell(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            onTap: () async {
              itRoute != '/' ? Navigator.of(context).pushNamed('/') : null;

              var status = await Permission.microphone.isDenied;

              if (itRoute == '/' && status) {
                await Permission.microphone.request();
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
