import 'dart:math';

import 'package:flutter/material.dart';

/*void main() {
  runApp(MyApp());
}*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guess my number',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{
  String input = '';
  String guessedNumber = '';
  String hintMessage = '';
  bool show = false;
  bool endGame = false;

  int randomNumber = Random().nextInt(100) +1;

  void checkNumber() {
    show = true;

    guessedNumber = input;

    if(int.parse(input) == randomNumber)
      hintMessage = 'You guessed right.';
    else if(int.parse(input) < randomNumber)
      hintMessage = 'Try higher';
    else
      hintMessage = 'Try lower';

    if(hintMessage == 'You guessed right.')
      endGame = true;
  }

  void _showContent() {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!

      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(input),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(hintMessage),
                Text('It was '+ randomNumber.toString()),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Try again!'),
              onPressed: () {
                Navigator.of(context).pop();
                endGame = false;
                randomNumber = Random().nextInt(100) +1;
                input = '';
                hintMessage = '';
                show = false;
                guessedNumber = '';
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: const Text('Number Shapes'),
      ),
      body: Column(
        children: <Widget>[
          const Text('I am thinking of a number between 1 and 100.'),
          const Text('It is your turn to guess my number!'),
          if(show)
            Text('You tried '+ guessedNumber),
          if(show)
            Text(hintMessage),
          TextField(
            onChanged: (String value) {
              setState(() {
                input = value;
              });
            },
          ),
          FlatButton(
              onPressed: () =>
                setState((){
                  checkNumber();
                  if(endGame)
                    _showContent();
                }),
              child: const Text('Guess')),
        ],
      ),
    );
  }
}
