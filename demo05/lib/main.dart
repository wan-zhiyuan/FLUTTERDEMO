import 'package:flutter/material.dart';
import 'keep_alive_demo.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo05',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: KeepAliveDemo(),
    );
  }
}

class KeepAliveDemo extends StatefulWidget {

  _KeepAliveDemoState createState() => _KeepAliveDemoState();
}

// with是dart的关键字，意思是混入的意思。将一个或者多个类添加到自己的类中，
class _KeepAliveDemoState extends State<KeepAliveDemo> with SingleTickerProviderStateMixin {
  TabController _controller;

  // 初始化方法
  @override
  void initState() { 
    super.initState();
    _controller =TabController(length: 3,vsync: this);
  }

  // 销毁方法
  @override
  void dispose() { 
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Keep Alive Demo'),
         bottom: TabBar(
           controller: _controller,
           tabs: <Widget>[
             Tab(icon: Icon(Icons.directions_car)),
             Tab(icon: Icon(Icons.directions_transit)),
             Tab(icon: Icon(Icons.directions_bike)),
           ],
         ),
        ),
        body: TabBarView(
          controller: _controller,
          children: <Widget>[
            MyHomePage(),
            MyHomePage(),
            MyHomePage(),
          ],
        ),
    );
  }
}