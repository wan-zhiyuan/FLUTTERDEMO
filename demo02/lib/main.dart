import 'package:flutter/material.dart';
import 'bottom_appBar_demo.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final Widget child;

  MyApp({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo02',
      // 自定义主题样本
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: new BottomAppBarDemo(),
    );
  }
}
