import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          color: Color.fromARGB(255, 240, 236, 236),
          child: InkWell(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            onTap: () {},
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
          child: InkWell(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            onTap: () {},
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
