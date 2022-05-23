import 'dart:ffi';

import 'Question.dart';

class QuizBrain {
  int _selectedQuestion = 0;

  final List<Question> _questions = [
    Question(
        title: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
    Question(
        title: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    Question(title: 'A slug\'s blood is green.', answer: true),
  ];

  String getQuestionTitle() {
    return _questions[_selectedQuestion].title ?? "";
  }

  bool getQuestionAnswer() {
    return _questions[_selectedQuestion].questionAnswer ?? false;
  }

  void nextQuestion() {
    if (_selectedQuestion < _questions.length - 1) _selectedQuestion++;
  }

  bool isQuizFinished() {
    print(_selectedQuestion);
    print(_questions.length);

    var isFinished = false;
    if (_selectedQuestion >= _questions.length - 1) {
      isFinished = true;
      _selectedQuestion = 0;
    } else {
      isFinished = false;
    }
    return isFinished;
  }
}
