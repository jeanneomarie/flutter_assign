import 'package:flutter/material.dart';

/*void main() {
  runApp(MyApp());
}*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
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
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Image.network('https://lh3.googleusercontent.com/proxy/WZy12ou3616VojsvqTddwRE_J0VbDfK0Z9GQG7x13bXK85u-GHtT6ceyLDgu7h0EVicb7DOaZfYtx2z8TyXm2f-JR5E24BOvFL-i2BmSLw'),
          TextField(
            onChanged: (String value) {
              setState(() {
                input = value;
              });
            },
            decoration: const InputDecoration(
                hintText: 'enter the amount in EUR'
            ),
          ),
          FlatButton(
              onPressed: () {
                setState(() {
                  result = (double.parse(input) * 4.8).toStringAsFixed(2) + ' RON';
                });
              },
              child: const Text('CONVERT!')),
          Text(result),
        ],
      ),
    );
  }

}
