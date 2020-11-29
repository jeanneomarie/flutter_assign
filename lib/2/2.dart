import 'dart:math';

import 'package:flutter/material.dart';

/*void main() {
  runApp(MyApp());
}*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Shapes',
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

  String checkNumber() {
    bool isSquare = false;
    bool isTriangular = false;

    if(sqrt(int.parse(input)) % 1 == 0)
      isSquare = true;

   if(sqrt(8 * int.parse(input) + 1) % 1 == 0)
      isTriangular = true;
   
    if(isSquare && isTriangular)
      return 'Number ' + input + ' is both SQUARE and TRIANGULAR.';
    else if(isSquare)
      return 'Number ' + input + ' is SQUARE.';
    else if(isTriangular)
      return 'Number ' + input + ' is TRIANGULAR.';
    else
      return 'Number ' + input + ' is neither TRIANGULAR or SQUARE.';
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
              children: [
                Text(checkNumber()),
              ],
            ),
          ),
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
          const Text('Please input a number to see if it is a square or a triangular.'),
          TextField(
            onChanged: (String value) {
              setState(() {
                input = value;
              });
            },
          ),
        ],
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: () => _showContent(),
        tooltip: 'Check Number Type',
        child: const Icon(Icons.check),
      ),
    );
  }
}
