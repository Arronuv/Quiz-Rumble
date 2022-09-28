
class SetClass{
    String id;
    List<Questions> ques;
    String name;
    String image;
    SetClass({required this.id,required this.name,required this.ques,required this.image});
}


  SetClass emptySetClass(){
  return SetClass(id: '', name: '', ques: [], image: '');
  }

class Questions{
  String id;
  String question;
  List<dynamic> answer;
  int option;
  Questions({required this.id,required this.answer,required this.option,required this.question});
}

Questions quesFromJSON(dynamic s){
  String id= s['id'];
  String question = s['question'];
  List<dynamic> answer=s['answers'];
  int option=s['correctIndex'];
  return Questions(id: id, answer: answer, option: option, question: question);
}

SetClass setFromJSON(dynamic s){
  String id =s['id'];
  String name=s['name'];
  List qu= s['questions'];
  List<Questions> ques=[];
  String image= s['image'];
  for(var q in qu) {
    ques.add(quesFromJSON(q));
  }
 // print(ques.first.id);
    return SetClass(id: id, name: name, ques: ques,image: image);
}