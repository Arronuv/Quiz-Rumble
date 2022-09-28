import 'package:flutter/material.dart';
import 'package:quizrumble/worker.dart';
import '../apptheme.dart';

class Result extends StatefulWidget {
  const Result(
      {Key? key,
      required this.backcolor,
      required this.score,
      required this.worker})
      : super(key: key);
  final List<Color> backcolor;
  final int score;
  final WorkerClass worker;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  List<Widget> body = [];
  AppTheme appTheme = AppTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: widget.backcolor.first,
        child: ListView(
          children: getBody(),
        ),
      ),
    );
  }

  List<Widget> getBody() {
    body = [];

    body.add(Container(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              size: 35.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ));
    body.add(Center(
      child: Container(
        padding: const EdgeInsets.all(30.0),
        child: Text(
          "Thanks for Playing !!!",
          style: appTheme.getStyle(30.0, Colors.white, FontWeight.bold),
        ),
      ),
    ));
    body.add(Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 5.0),
      ),
      child: Center(
          child: Text(
        "${widget.score.toString()}/${widget.worker.currentSet.ques.length}",
        style: appTheme.getStyle(90.0, Colors.white, FontWeight.bold),
      )),
    ));

    body.add(Container(
      padding: const EdgeInsets.fromLTRB(20.0, 70.0, 20.0, 12.0),
      child: MaterialButton(
        elevation: 10.0,
        minWidth: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.07,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Colors.white,
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        child: Text(
          "Exit",
          style:
              appTheme.getStyle(20.0, widget.backcolor.first, FontWeight.bold),
        ),
      ),
    ));

    return body;
  }
}
