// CountDown: モデル
class CountDown {
  CountDown(this.name, this.time, {this.editing : false});
  final String name;
  int time;
  bool editing;
}
