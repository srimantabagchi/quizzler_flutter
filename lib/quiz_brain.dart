import 'package:flutter/material.dart';
import 'package:quizzler_flutter/question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Icon> _scoreKeeper = [];

  List<Question> _questions = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  String getQuestionText() {
    return _questions[_questionNumber].questionText;
  }

  bool getAnswer() {
    return _questions[_questionNumber].questionAnswer;
  }

  List<Icon> getScoreKeeper(){
    return _scoreKeeper;
  }

  void checkAnswer(bool userPickedAnswer, BuildContext context) {
    if (getAnswer() == userPickedAnswer) {
      _scoreKeeper.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
    } else {
      _scoreKeeper.add(Icon(
        Icons.close,
        color: Colors.red,
      ));
    }
    nextQuestion(context);
  }

  void nextQuestion(BuildContext context) {
    if (_questionNumber + 1 < _questions.length)
      _questionNumber++;
    else {
      Alert(
              context: context,
              title: "Finished!",
              desc: "You've reached the end of the quiz.")
          .show();
      _questionNumber = 0;
      _scoreKeeper = [];
    }
  }
}
