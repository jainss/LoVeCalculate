import 'package:flutter/material.dart';
import 'calculation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LOVE CALCULATOR',
      home: MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget {
  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  String firstName;
  String secondName;
  int score;
  void loveScore() {
    score = calculation(firstName: firstName, secondName: secondName);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ScorePage(score: score)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOVE CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                tag: 'lovegif',
                child: Image(
                  image: AssetImage('assets/images/logo.gif'),
                ),
              ),
            ),
          ),
          TextField(
            onChanged: (value) {
              firstName = value;
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              hintText: 'Enter Your Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                borderSide: BorderSide(
                  color: Colors.blueAccent,
                  width: 1.0,
                ),
              ),
            ),
          ),
          TextField(
            onChanged: (value) {
              secondName = value;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                borderSide: BorderSide(
                  color: Colors.lightBlueAccent,
                  width: 1.0,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              hintText: 'Enter your partner name',
            ),
          ),
          RaisedButton(
            onPressed: () {
              loveScore();
            },
            child: Text(
              'CALCULATE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            color: Colors.blue,
            hoverColor: Colors.lightBlueAccent,
          )
        ],
      ),
    );
  }
}

class ScorePage extends StatelessWidget {
  const ScorePage({
    Key key,
    @required this.score,
  }) : super(key: key);

  final int score;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Love Number is',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Hero(
                tag: 'lovegif',
                child: Image(image: AssetImage('assets/images/logo.gif')),
              ),
            ),
          ),
          Text(
            'Your Score is : $score',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
