import 'package:flutter/material.dart';

class EmailScreen extends StatelessWidget {
  final Widget child;

  EmailScreen({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EMAIL'),),
      body: Center(
        child: Text('EMAIL'),
      ),
    );
  }
}