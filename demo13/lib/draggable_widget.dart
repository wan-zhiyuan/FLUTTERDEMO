import 'package:flutter/material.dart';

class DraggableWidget extends StatefulWidget {
  // 部件需要接受参数就必须重写构造方法
  final Offset offset; // 位置
  final Color widgetColor; // 颜色
  // 重写构造方法
  const DraggableWidget({Key key,this.offset,this.widgetColor}):super(key:key);
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  
  Offset offset =Offset(0.0, 0.0);

  void initState() { 
    super.initState();
    offset=widget.offset; // 取部件传递过来的offset
  }
  
  @override
  Widget build(BuildContext context) {
    return Positioned(
       left: offset.dx,
       top: offset.dy,
       child: Draggable( // 可拖动的部件
          data: widget.widgetColor, // 传递的信息，这里传递的是颜色信息
          child: Container(
            width: 100.0,
            height: 100.0,
            color: widget.widgetColor,
          ),
          feedback: Container( // 拖动时，子元素的样子(鼠标拖拽时的)
            width: 100.0,
            height: 100.0,
            color: widget.widgetColor.withOpacity(0.5), // 原部件颜色半透明效果
          ),
          onDraggableCanceled: (Velocity velocity,Offset offset){ // 松手的时候
            setState(() {
             this.offset = offset;  // 将原部件位置 设置为 拖动到的位置
            });
          },
       ),
    );
  }
}