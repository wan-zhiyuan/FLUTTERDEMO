import 'package:flutter/material.dart';
import '_bottom_navigation_widget.dart';

void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BottomNavigationWidget',
      theme: ThemeData.light(),
      home: new BottomNavigationWidget(),
    );
  }
}