import 'package:flutter/material.dart';
import 'package:quizrumble/apptheme.dart';
import 'homeicon.dart';

class appBar extends StatelessWidget {
  appBar({Key? key, required this.appTheme}) : super(key: key);

  AppTheme appTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 30.0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              homeIcon(
                  icon: Icons.favorite, size: 20.0, iconColor: Colors.blue),
              const SizedBox(
                width: 10.0,
              ),
              homeIcon(icon: Icons.person, size: 20.0, iconColor: Colors.blue),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Let's Play",
                  style: appTheme.getStyle(
                      30.0, Colors.redAccent, FontWeight.bold)),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                "Be the first!",
                style: appTheme.getStyle(15.0, Colors.grey, FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}
