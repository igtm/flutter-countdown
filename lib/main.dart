import 'package:flutter/material.dart';
import 'models.dart';
import 'add-screen.dart';
import 'list-screen.dart';
import 'countdown-screen.dart';

void main() {
  runApp(new MyCountDownApp());
}

class MyCountDownApp extends StatefulWidget {
  _MyCountDownState createState() => new _MyCountDownState();
}

class _MyCountDownState extends State<MyCountDownApp> {
  var _list = <CountDown>[
    new CountDown('Flutterの勉強', 15),
    new CountDown('Kotlinの勉強', 10),
    new CountDown('Nuxt.jsの勉強', 20),
    new CountDown('Golangの勉強', 250),
  ];
  CountDown selectedCountDown;

  addCountDown(CountDown c) {
    setState((){
      _list.add(c);
    });
  }

  goCountDown(BuildContext context, CountDown c) {
    setState((){
      selectedCountDown = c;
    });
    Navigator.of(context).pushNamed('/countdown');
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Navigation Basics',
      routes: <String, WidgetBuilder>{
         '/':    (BuildContext context) => new CountDownListScreen(_list, goCountDown), // 一番初めは '/' になるので homeがいらない
         '/add': (BuildContext context) => new AddItemScreen(addCountDown),
         '/countdown': (BuildContext context) => new CountDownScreen(selectedCountDown),
      }
    );
  }
}