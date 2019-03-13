import 'package:flutter/material.dart';
import 'draggable_widget.dart';

class DraggableDemo extends StatefulWidget {

  _DraggableDemoState createState() => _DraggableDemoState();
}

class _DraggableDemoState extends State<DraggableDemo> {

  Color _draggableColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text('Draggable'),),
       body: Stack(
         children: <Widget>[
           DraggableWidget(
             offset: Offset(80.0, 80.0),
             widgetColor: Colors.tealAccent,
           ),
           DraggableWidget(
             offset: Offset(180.0, 80.0),
             widgetColor: Colors.redAccent,
           ),
           Center(
             child: DragTarget( // 拖拽接收器
                onAccept: (Color color){ // 接收的信息时color
                  _draggableColor = color;
                },builder: (context,candidateData,rejectedData){
                  return Container(
                    width: 200.0,
                    height: 200.0,
                    color: _draggableColor,
                  );
                },
             ),
           )
         ],
       ),
    );
  }
}
