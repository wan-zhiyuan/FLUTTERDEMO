import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final Widget child;

  HomeScreen({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HOME'),),
      body: Center(
        child: Text('HOME'),
      ),
    );
  }
}