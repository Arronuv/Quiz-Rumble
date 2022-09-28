import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quizrumble/Quesclass/setclass.dart';
import 'package:quizrumble/Screens/Result.dart';
import 'package:quizrumble/apptheme.dart';
import 'package:quizrumble/worker.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key, required this.backcolor, required this.worker})
      : super(key: key);
  final List<Color> backcolor;
  final WorkerClass worker;

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  AppTheme appTheme = AppTheme();
  List<Widget> body = [];
  late SetClass testSet;
  int i = 0;
  int score = 0;
  bool completed = false;

  @override
  void initState() {
    testSet = widget.worker.currentSet;
    super.initState();
  }

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
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
          const Spacer(),
          CircularPercentIndicator(
            animation: true,
            radius: 25.0,
            percent: (i + 1) / testSet.ques.length,
            lineWidth: 4.0,
            center: Text(
              "${i + 1}",
              style: appTheme.getStyle(20.0, Colors.white, FontWeight.normal),
            ),
            progressColor: Colors.white,
          ),
          const Spacer(),
          Container(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                border: Border.all(color: Colors.white),
              ),
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.favorite, color: Colors.white, size: 20.0),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "0",
                      style: appTheme.getStyle(
                          20.0, Colors.white, FontWeight.normal),
                    ),
                  ],
                ),
              ))
        ],
      ),
    ));

    body.add(ClipRect(
      child: Image.asset(
        "assets/setimages/test${testSet.id.substring(1)}.png",
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width * 0.3,
      ),
    ));

    body.add(Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "question ${i + 1} of ${testSet.ques.length}",
            style: appTheme.getStyle(20.0, Colors.white60, FontWeight.normal),
          ),
          Text(
            testSet.ques[i].question,
            style: appTheme.getStyle(25.0, Colors.white, FontWeight.normal),
          ),
        ],
      ),
    ));

    for (int y = 0; y < testSet.ques[i].answer.length; y++) {
      String option = testSet.ques[i].answer[y].toString();
      int r = testSet.ques[i].option;
      body.add(Container(
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 12.0),
        child: MaterialButton(
          elevation: 10.0,
          minWidth: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.07,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          color: Colors.white,
          onPressed: () {
            setState(() {
              if (y + 1 == r) {
                score++;
              }
              if (i < testSet.ques.length - 1) {
                i++;
              } else {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Result(
                        backcolor: widget.backcolor,
                        score: score,
                        worker: widget.worker)));
              }
            });
          },
          child: Text(
            option,
            style: appTheme.getStyle(
                20.0, widget.backcolor.first, FontWeight.bold),
          ),
        ),
      ));
    }

    return body;
  }
}
