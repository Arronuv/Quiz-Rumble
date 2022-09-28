import 'package:flutter/material.dart';
import 'package:quizrumble/Screens/test.dart';
import 'package:quizrumble/apptheme.dart';
import 'package:quizrumble/worker.dart';

class StartTest extends StatefulWidget {
  const StartTest(
      {Key? key,
      required this.worker,
      required this.backcolor,
      required this.appTheme})
      : super(key: key);
  final WorkerClass worker;
  final List<Color> backcolor;
  final AppTheme appTheme;

  @override
  State<StartTest> createState() => _StartTestState();
}

class _StartTestState extends State<StartTest> {
  List<Widget> body = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: widget.backcolor,
          )),
          child: ListView(children: getBody())),
    );
  }

  List<Widget> getBody() {
    body = [];
    body.add(Container(
      padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              size: 35.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 60.0,
          ),
          Center(
            child: ClipRect(
              child: Image.asset(
                "assets/setimages/${widget.worker.currentSet.image}",
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
            child: Text(
              "Level ${widget.worker.currentSet.id.substring(1)}",
              style: widget.appTheme
                  .getStyle(15.0, Colors.white70, FontWeight.normal),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
            child: Text(
              widget.worker.currentSet.name,
              style: widget.appTheme
                  .getStyle(25.0, Colors.white, FontWeight.normal),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
            child: Text(
              'Do you feel confident? Here you\'ll challenge one of our most difficult travel questions!',
              style: widget.appTheme
                  .getStyle(12.0, Colors.white70, FontWeight.normal),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const SizedBox(
            height: 40.0,
          ),
          Center(
            child: MaterialButton(
              elevation: 10.0,
              minWidth: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.07,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TestPage(
                          backcolor: widget.backcolor,
                          worker: widget.worker,
                        )));
              },
              child: Text(
                "Game",
                style: widget.appTheme
                    .getStyle(20.0, widget.backcolor.first, FontWeight.normal),
              ),
            ),
          )
        ],
      ),
    ));
    return body;
  }
}
