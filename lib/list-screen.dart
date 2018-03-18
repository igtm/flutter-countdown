import 'package:flutter/material.dart';
import 'models.dart';
import 'types.dart';

class CountDownListScreen extends StatelessWidget {
  List<CountDown> _list;
  GoCountDown goCountDown;
  CountDownListScreen(this._list, this.goCountDown);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('カウントダウン一覧'),
      ),
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
            onTap: (){
              goCountDown(context, _list[index]);
            },
            child: new CountDownItem(_list[index])
          );
        },
        itemCount: _list.length,
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add',
        child: new Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).pushNamed('/add');
        },
      ),
    );
  }
}

class CountDownItem extends StatelessWidget {
  final CountDown item;
  CountDownItem(this.item);

  @override
  Widget build(BuildContext context) {
    String name = item.name;
    int time = item.time;
    return new ListTile(title: new Text('$name: $time分'));
  }
}
