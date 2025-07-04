import 'package:flutter/material.dart';
import './quiz.dart';
import './weather.dart';
import './counter.dart';
import './contact.dart';
import './gallery.dart';

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

            // Première ligne : Quiz & Weather
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildAppButton(
                  icon: Icons.quiz,
                  label: 'Quiz',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(
                            title: Text('Quiz App', style: TextStyle(color: Colors.white)),
                            backgroundColor: Colors.orangeAccent,
                            iconTheme: IconThemeData(color: Colors.white),
                          ),
                          body: Center(child: Quiz()),
                        ),
                      ),
                    );
                  },
                ),
                buildAppButton(
                  icon: Icons.wb_sunny,
                  label: 'Weather',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Weather()));
                  },
                ),
              ],
            ),

            SizedBox(height: 20),

            // Deuxième ligne : Counter, Contact, Gallery
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildAppButton(
                  icon: Icons.countertops,
                  label: 'Counter',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CounterPage()));
                  },
                ),
                buildAppButton(
                  icon: Icons.contact_mail,
                  label: 'Contact',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ContactPage()));
                  },
                ),
                buildAppButton(
                  icon: Icons.photo_library,
                  label: 'Gallery',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Gallery()));
                  },
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
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(
                        title: Text('Quiz App', style: TextStyle(color: Colors.white)),
                        backgroundColor: Colors.orangeAccent,
                        iconTheme: IconThemeData(color: Colors.white),
                      ),
                      body: Center(child: Quiz()),
                    ),
                  ),
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
            ListTile(
              leading: Icon(Icons.countertops, color: Colors.orange),
              title: Text('Counter', style: TextStyle(fontSize: 18)),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CounterPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail, color: Colors.orange),
              title: Text('Contact', style: TextStyle(fontSize: 18)),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library, color: Colors.orange),
              title: Text('Gallery', style: TextStyle(fontSize: 18)),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Gallery()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget pour créer un bouton d'application réutilisable
  Widget buildAppButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
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
            Icon(icon, size: 40, color: Colors.orange),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.orange[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
