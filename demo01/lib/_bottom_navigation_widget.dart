import 'package:flutter/material.dart';
import 'pages/home_screen.dart';
import 'pages/email_screen.dart';
import 'pages/pages_screen.dart';
import 'pages/airplay_screen.dart';

class BottomNavigationWidget extends StatefulWidget {

  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _bottomNavigationColor = Colors.red;
  int _currentIndex = 0;
  List<Widget> list = new List();

  @override
  void initState(){
    list
      ..add(new HomeScreen())
      ..add(new EmailScreen())
      ..add(new PagesScreen())
      ..add(new AirplayScreen());
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
         items: [
           new BottomNavigationBarItem(
             icon: Icon(Icons.home,color: _bottomNavigationColor,),
             title: Text('Home',style:TextStyle(color: _bottomNavigationColor)),
           ),
           new BottomNavigationBarItem(
             icon: Icon(Icons.email,color: _bottomNavigationColor,),
             title: Text('Email',style:TextStyle(color: _bottomNavigationColor)),
           ),
           new BottomNavigationBarItem(
             icon: Icon(Icons.pages,color: _bottomNavigationColor,),
             title: Text('Pages',style:TextStyle(color: _bottomNavigationColor)),
           ),
           new BottomNavigationBarItem(
             icon: Icon(Icons.airplay,color: _bottomNavigationColor,),
             title: Text('Airplay',style:TextStyle(color: _bottomNavigationColor)),
           ),
         ],
         currentIndex: _currentIndex,
         onTap: (int index){
           setState(() {
            _currentIndex = index; 
           });
         },
      ),
    );
  }
}