import 'package:flutter/material.dart';
import 'custom_route.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar:AppBar(
        title: Text('FirstPage', style: TextStyle(fontSize: 36.0)),
        elevation: 0.0,// 与底部body的融合情况，默认值是4.0
        ),
        body: Center(
          child: MaterialButton(
            child: Icon(
              Icons.navigate_next,
              color: Colors.white,
              size: 64.0,
            ),
            onPressed: (){
              Navigator.of(context).push(CustomRoute(new SecondPage()));
            },
          ),
        ),
    );
  }
}

class SecondPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text('SecondPage', style: TextStyle(fontSize: 36.0)),
        // appBar如果不设置背景颜色会和主题颜色一致，及Colors.blue
        backgroundColor: Colors.pinkAccent,
        elevation: 0.0,// 与底部body的融合情况，默认值是4.0，appBar底部的阴影效果大小
        ),
        body: Center(
          child: MaterialButton(
            child: Icon(
              Icons.navigate_before,
              color: Colors.white,
              size: 64.0,
            ),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ),
    );
  }
}