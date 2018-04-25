import 'package:flutter/material.dart';
import '../utils/quiz.dart';
import '../utils/question.dart';
import'../ui/answer_button.dart';

class QuizPage extends StatefulWidget {
  //stateful can be rebuilt, can change over time
  //This class is actually immutable, no class variables,
  //but we conenct it to a state which is mutable
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return new Stack (
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () => print("You answered true")),
            new AnswerButton(false, () => print("You answered false")),
          ],
         ),
      ], // Widgets
    ); // Stack
  }
}
