import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String _question;
  final int _currentQuestionIndex;
  final int _numberOfQuestions;

  Question(this._question, this._currentQuestionIndex, this._numberOfQuestions);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          // Progress indicator
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: LinearProgressIndicator(
              value: (_currentQuestionIndex + 1) / _numberOfQuestions,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
            ),
          ),

          // Question counter
          Text(
            'Question ${_currentQuestionIndex + 1} of $_numberOfQuestions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.orangeAccent,
            ),
          ),

          SizedBox(height: 20),

          // Question container
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.orange[50],
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.orangeAccent, width: 2),
            ),
            child: Text(
              _question,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}