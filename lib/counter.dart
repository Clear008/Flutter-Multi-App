import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Compteur :', style: TextStyle(fontSize: 24)),
            Text('$_counter', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  child: Icon(Icons.add),
                  backgroundColor: Colors.orange,
                ),
                SizedBox(width: 20),
                FloatingActionButton(
                  onPressed: _decrementCounter,
                  child: Icon(Icons.remove),
                  backgroundColor: Colors.orange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
