import 'package:flutter/material.dart';

class WarpDemo extends StatefulWidget {

  _WarpDemoState createState() => _WarpDemoState();
}

class _WarpDemoState extends State<WarpDemo> {
  List<Widget> list;

  void initState() { 
    super.initState();
    list = List<Widget>()..add(buildAddButton());
  }
  
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;// 媒体查询，获取屏幕宽度
    final height = MediaQuery.of(context).size.height;// 媒体查询，获取屏幕的高度

    return Scaffold(
       appBar: AppBar(title: Text('Wrap流式布局'),),
       body: Center(
         child: Opacity(// 透明度效果
           opacity: 0.8,
           child: Container(
            width: width,
            height: height/2,
            color: Colors.grey,
            child: Wrap(
              children: list,
              spacing: 26.0,
            ),
           ),
         ),
       ),
    );
  }

  // 添加一个手势操作的组件
  Widget buildAddButton(){
    return GestureDetector(
      onTap: (){
        if(list.length<9){
          setState(() {
            list.insert(list.length-1, buildPhoto());
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  // 添加一个照片组件
  Widget buildPhoto(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 80.0,
        height: 80.0,
        color: Colors.amber,
        child: Center(
          child: Text('照片'),
        ),
      ),
    );
  }
}