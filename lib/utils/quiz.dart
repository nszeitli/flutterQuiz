import 'question.dart';

class Quiz{
  List<Question> _questions;
  int _currentQuestionIndex = -1;
  int _score = 0;

  Quiz(this._questions) {
    _questions.shuffle();
  }

  int get length => _questions.length;
  int get questionNumber => currentQuestionIndex + 1;
  int get score => _score;
  int get currentQuestionIndex => _currentQuestionIndex;

  Question get nextQuestion {
    _currentQuestionIndex++;
    if(_currentQuestionIndex >= _questions.length) {_currentQuestionIndex = 0; return _questions[_currentQuestionIndex];}
    else {return _questions[_currentQuestionIndex];}
  }

  void answer(bool isCorrect) {
    if(isCorrect) _score++;
  }
}