import 'package:flutter/material.dart';
import 'package:quizrumble/Quesclass/setclass.dart';
import 'package:quizrumble/Screens/currentTest.dart';
import 'package:quizrumble/apptheme.dart';
import 'package:quizrumble/worker.dart';
import '../Widgets/appbar.dart';
import '../Widgets/testtile.dart';

class Home extends StatefulWidget {
  final WorkerClass worker;

  const Home({Key? key, required this.worker}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AppTheme appTheme = AppTheme();
  List<Widget> bl = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          appBar(
            appTheme: appTheme,
          ),
          Expanded(child: getBody()),
        ]),
      ),
    );
  }

  Widget getBody() {
    bl = [];
    int i = 0;
    for (SetClass set in widget.worker.queSets) {
      bl.add(testTile(
        context: context,
        set: set,
        i: i,
        appTheme: appTheme,
        icon: Icons.play_circle_outline_sharp,
        onClick: () {
          setState(() {
            widget.worker.currentSet = set;
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => StartTest(
                      appTheme: appTheme,
                      worker: widget.worker,
                      backcolor: appTheme
                          .getColors(int.parse(set.id.substring(1)) - 1),
                    )));
          });
        },
      ));
      bl.add(const SizedBox(
        height: 10.0,
      ));
      i++;
    } // Test Sets

    return ListView(
      children: bl,
    );
  }
}
