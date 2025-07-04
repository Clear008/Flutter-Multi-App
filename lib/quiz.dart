import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';
import 'score.dart';

class Quiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuizState();
  }
}

class QuizState extends State<Quiz> {
  int currentQuestionIndex = 0;
  int score = 0;

  final quiz = [
    {
      'question': 'Q 1 - Which of the following is correct about Java 8 lambda expression ?',
      'answers': [
        {'answer': 'A - Using lambda expression, you can refer to final variable or effectively final variable (which is assigned only once)', 'correct': false},
        {'answer': 'B - Lambda expression throws a compilation error, if a variable is assigned a value the second time ?', 'correct': false},
        {'answer': 'C - Both of the above.', 'correct': true},
        {'answer': 'D - None of the above.', 'correct': false},
      ],
    },
    {
      'question': 'Q 2 - Which of the following is the correct lambda expression which add two numbers and return their sum?',
      'answers': [
        {'answer': 'A - (int a, int b) -> { return a + b;};', 'correct': false},
        {'answer': 'B - (a, b) -> {return a + b;};', 'correct': false},
        {'answer': 'C - Both of the above.', 'correct': true},
        {'answer': 'D - None of the above.', 'correct': false},
      ],
    },
    {
      'question': 'Q 3 - What is the main advantage of using Flutter for mobile development?',
      'answers': [
        {'answer': 'A - Single codebase for multiple platforms', 'correct': true},
        {'answer': 'B - Only works on Android', 'correct': false},
        {'answer': 'C - Only works on iOS', 'correct': false},
        {'answer': 'D - Requires separate code for each platform', 'correct': false},
      ],
    },
    {
      'question': 'Q 4 - Which programming language is used to develop Flutter apps?',
      'answers': [
        {'answer': 'A - Java', 'correct': false},
        {'answer': 'B - Kotlin', 'correct': false},
        {'answer': 'C - Dart', 'correct': true},
        {'answer': 'D - Swift', 'correct': false},
      ],
    },
    {
      'question': 'Q 5 - What is a StatefulWidget in Flutter?',
      'answers': [
        {'answer': 'A - A widget that never changes', 'correct': false},
        {'answer': 'B - A widget that can change its state during runtime', 'correct': true},
        {'answer': 'C - A widget only for text display', 'correct': false},
        {'answer': 'D - A widget for images only', 'correct': false},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return (currentQuestionIndex >= quiz.length)
        ? Score(score, resetQuiz, quiz.length)
        : SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Question(
            quiz[currentQuestionIndex]['question'] as String,
            currentQuestionIndex,
            quiz.length,
          ),
          SizedBox(height: 20),
          ...(quiz[currentQuestionIndex]['answers'] as List<Map<String, Object>>)
              .map((answer) {
            return Answer(answer, handleAnswer);
          }),
        ],
      ),
    );
  }

  void handleAnswer(Map<String, Object> answer) {
    print('Answer of question $currentQuestionIndex');

    if (answer['correct'] == true) {
      setState(() {
        score++;
      });
    }

    setState(() {
      currentQuestionIndex++;
    });
  }

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
    });
  }
}