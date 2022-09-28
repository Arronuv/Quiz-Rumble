import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:quizrumble/Quesclass/setclass.dart';

class WorkerClass {
  int sets = 0;
  List<SetClass> queSets = []; //QuestionTiles
  List<bool> locks = [true]; //tileLocks
  SetClass currentSet = emptySetClass();

  Future loadJSON() async {
    String path = "assets/questions/data.json";
    dynamic load = await rootBundle.loadString(path);
    Map<String, dynamic> result = json.decode(load);
    sets = result.length;
    for (var v in result.entries) {
      queSets.add(setFromJSON(v.value));
      locks.add(false);
    }
  } // Load Sets and Questions

}
