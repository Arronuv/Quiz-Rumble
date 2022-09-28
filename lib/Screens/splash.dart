import 'package:flutter/material.dart';
import 'package:quizrumble/apptheme.dart';
import 'package:quizrumble/worker.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool change = true;
  late AppTheme appTheme;
  WorkerClass worker = WorkerClass();

  @override
  void initState() {
    appTheme = AppTheme();
    // TODO: implement initState

    loadData();
    super.initState();
  }

  Future loadData() async {
    await worker.loadJSON();
    Future.delayed(const Duration(seconds: 9), () {
      setState(() {
        change = false;
      });
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return change
        ? Scaffold(
            body: Container(
              color: appTheme.splashBack,
              child: Center(
                child: Image.asset(
                  'assets/splash.gif',
                  height: 160.0,
                  width: 140.0,
                ),
              ),
            ),
          )
        : Home(
            worker: worker,
          );
  }
}
