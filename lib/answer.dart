import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Map<String, Object> _answer;
  final Function _handleAnswer;

  Answer(this._answer, this._handleAnswer);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orangeAccent,
            foregroundColor: Colors.white,
            padding: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 3,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              _answer['answer'] as String,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          onPressed: () => _handleAnswer(_answer),
        ),
      ),
    );
  }
}
