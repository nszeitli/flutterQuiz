import 'package:flutter/material.dart';
import '../utils/quiz.dart';
import '../utils/question.dart';
import'../ui/answer_button.dart';
import '../ui/correct_wrong_overlay.dart';
import '../ui/question_text.dart';
import '../pages/score_page.dart';

class QuizPage extends StatefulWidget {
  //stateful can be rebuilt, can change over time
  //This class is actually immutable, no class variables,
  //but we conenct it to a state which is mutable
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  
  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Nathan would like another biscuit?", true),
    new Question("Shaira would like another biscuit?", true),
    new Question("Nathan should not have bought the biscuits?", false)
  ]);
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisable = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisable = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack (
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)),
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => handleAnswer(false)),
          ],
         ),
         overlayShouldBeVisable == true ? new CorrectWrongOverlay(isCorrect,
          () {
            if (quiz.length == questionNumber) {
              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)));
              return;
            }
            currentQuestion = quiz.nextQuestion;
            this.setState(() {
              overlayShouldBeVisable = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
            });
          }
          ) : new Container()
      ], // Widgets
    ); // Stack
  }
}
