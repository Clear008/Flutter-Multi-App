import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final int _score;
  final int _numberOfQuestions;
  final Function _resetQuiz;

  Score(this._score, this._resetQuiz, this._numberOfQuestions);

  @override
  Widget build(BuildContext context) {
    final percentage = (_score / _numberOfQuestions * 100).round();

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Trophy icon based on score
          Icon(
            percentage >= 80 ? Icons.emoji_events :
            percentage >= 60 ? Icons.thumb_up :
            Icons.sentiment_neutral,
            size: 80,
            color: percentage >= 80 ? Color(0xFFFFD700) :
            percentage >= 60 ? Colors.green :
            Colors.orange,
          ),

          SizedBox(height: 20),

          // Score message
          Text(
            _getScoreMessage(percentage),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.orangeAccent,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 20),

          // Detailed results
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.orange[50],
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.orangeAccent),
            ),
            child: Column(
              children: [
                Text(
                  'Your Score: $_score / $_numberOfQuestions',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Percentage: $percentage%',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 30),

          // Restart button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
              ),
              icon: Icon(Icons.refresh, size: 24),
              label: Text(
                'Restart Quiz',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () => _resetQuiz(),
            ),
          ),
        ],
      ),
    );
  }

  String _getScoreMessage(int percentage) {
    if (percentage >= 80) {
      return '🎉 Excellent! 🎉';
    } else if (percentage >= 60) {
      return '👍 Good Job! 👍';
    } else if (percentage >= 40) {
      return '😊 Not Bad! 😊';
    } else {
      return '📚 Keep Learning! 📚';
    }
  }
}