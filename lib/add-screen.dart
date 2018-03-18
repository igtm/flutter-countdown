import 'package:flutter/material.dart';
import 'models.dart';

class AddItemScreen extends StatefulWidget {
  final ValueSetter<CountDown> setter;
  AddItemScreen(this.setter);

  @override
  _AddItemScreenState createState() => new _AddItemScreenState(setter);
}

class _AddItemScreenState extends State<AddItemScreen> {
  final ValueSetter<CountDown> setter;
  _AddItemScreenState(this.setter);
  String name;
  int time;

  _changeName(String _name){
    setState((){
      name = _name;
    });
  }

  _changeTime(String _time){
    setState((){
      time = int.parse(_time);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("カウントダウン作成"),
      ),
      body: new Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: new TextField(
                onChanged: _changeName,
                decoration: new InputDecoration(
                  hintText: '名前',
                ),
              )
            ),
            new Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: new TextField(
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  hintText: '分数',
                ),
                onChanged: _changeTime,
              )
            ),
            new RaisedButton(
                onPressed: () {
                  setter(
                    new CountDown(name, time)
                  );
                  Navigator.of(context).pop(true);
                },
                child: new Text('保存'),
            ),
          ],
        )
      )
    );
  }
}