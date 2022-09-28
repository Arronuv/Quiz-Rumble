import 'package:flutter/material.dart';
import 'package:quizrumble/worker.dart';
import '../Quesclass/setclass.dart';
import '../apptheme.dart';

class testTile extends StatelessWidget {
  testTile(
      {Key? key,
      required this.context,
      required this.set,
      required this.appTheme,
      required this.icon,
      required this.i,
      required this.onClick})
      : super(key: key);

  final BuildContext context;
  final SetClass set;
  final AppTheme appTheme;
  final Function() onClick;
  final IconData icon;
  final int i;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: SizedBox(
        height: MediaQuery.of(context).size.height*0.25,
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: appTheme.getColors(i),
                ),
              ),
              height: MediaQuery.of(context).size.height*0.2,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 35.0,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Level ${set.id.substring(1)}",
                    style: appTheme.getStyle(
                        15.0, Colors.white70, FontWeight.normal),
                  ),
                  Text(
                    set.name,
                    style: appTheme.getStyle(
                        25.0, Colors.white, FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 260.0,
            bottom: 90.0,
            child: ClipRect(
              child: Image.asset(
                "assets/setimages/${set.image}",
                height: MediaQuery.of(context).size.height*0.12,
                width: MediaQuery.of(context).size.width*0.2,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
