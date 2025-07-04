
import 'package:flutter/material.dart';
import './quiz.dart';
import './weather.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'First App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Text(
              'Choisissez une application :',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Icône Quiz
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Scaffold(
                        appBar: AppBar(
                          title: Text('Quiz App', style: TextStyle(color: Colors.white)),
                          backgroundColor: Colors.orangeAccent,
                          iconTheme: IconThemeData(color: Colors.white),
                        ),
                        body: Center(child: Quiz()),
                      )),
                    );
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.quiz,
                          size: 50,
                          color: Colors.orange,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Quiz',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Icône Weather
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Weather()),
                    );
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.wb_sunny,
                          size: 50,
                          color: Colors.orange,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Weather',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.orange, Colors.white]),
              ),
              child: Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://www.w3schools.com/howto/img_avatar.png'),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.quiz, color: Colors.orange),
              title: Text('Quiz', style: TextStyle(fontSize: 18)),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Scaffold(
                    appBar: AppBar(
                      title: Text('Quiz App', style: TextStyle(color: Colors.white)),
                      backgroundColor: Colors.orangeAccent,
                      iconTheme: IconThemeData(color: Colors.white),
                    ),
                    body: Center(child: Quiz()),
                  )),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.wb_sunny, color: Colors.orange),
              title: Text('Weather', style: TextStyle(fontSize: 18)),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Weather()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}