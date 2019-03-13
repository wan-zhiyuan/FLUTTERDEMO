import 'package:flutter/material.dart';
import 'each_view.dart';

class BottomAppBarDemo extends StatefulWidget {
  final Widget child;

  BottomAppBarDemo({Key key, this.child}) : super(key: key);

  _BottomAppBarDemoState createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo> {
  List<Widget> _eachView;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _eachView = List();
    _eachView..add(EachView('Home'))..add(EachView('ibarrel'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _eachView[_index],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                builder: (BuildContext context) {
            return EachView('New Page');
          }));
        },
        tooltip: 'ibarrel', // 按钮提示（长按时显示）
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, // FAB的位置放置
      bottomNavigationBar: BottomAppBar(
        // 底部工具栏，相比BottomNavigationBar底部导航栏更加灵活
        color: Colors.lightBlue, // 整个底部工具栏的背景颜色
        shape: CircularNotchedRectangle(), // 在矩形中间的圆形缺口，shape属性表示融合FAB时候的样式
        child: Row(
          // 这里可以放置很多类型的组件，可以自己设计
          mainAxisSize: MainAxisSize
              .max, // 相当于android中的match_parent属性；同理min相当于wrap_content
          mainAxisAlignment: MainAxisAlignment.spaceAround, // 主轴上的排列方式，详情见学习笔记
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white, // 按钮图标颜色
              onPressed: () {
                setState(() {
                  _index = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.airport_shuttle),
              color: Colors.white, // 按钮图标颜色
              onPressed: () {
                setState(() {
                  _index = 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
