import 'dart:async';
import 'package:flutter/material.dart';
import 'models.dart';

class CountDownScreen extends StatefulWidget {
  CountDown c;
  CountDownScreen(this.c);

  @override
  _CountDownScreenState createState() => new _CountDownScreenState(c);
}

class _CountDownScreenState extends State<CountDownScreen> {
  String name;
  int defaultMinutes;
  int minutes;
  int seconds = 0;
  Timer t;

  _CountDownScreenState(CountDown c) {
    name = c.name;
    defaultMinutes = c.time;
    minutes = c.time;
  }

  _decrementTime(){
    setState((){
      if(seconds == 0) {
        minutes--;
        seconds = 59;
      } else {
        seconds--;
      }
    });
  }

  _resetTime(){
    setState((){
      minutes = defaultMinutes;
      seconds = 0;
    });
  }

  _startTimeout(int _minutes) {
    Duration timeout = new Duration(seconds: 1);
    t = new Timer(timeout, (){
      _decrementTime();
      if (minutes > 0 && seconds > 0) {
        _startTimeout(_minutes);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimeout(minutes);
  }

  @override
  void dispose() {
    t.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(name),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 10.0),
              child: new Text(
                '$minutes分$seconds秒',
                style: new TextStyle(
                  fontSize: 68.0,
                  fontWeight: FontWeight.w900,
                  fontFamily: "Georgia",
                )
              ),
            ),
            new RaisedButton(
                onPressed: _resetTime,
                child: new Text('リセット'),
            )
          ],
        ),)
    );
  } 
}