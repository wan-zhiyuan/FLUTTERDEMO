import 'package:flutter/material.dart';

class ExpansionTileDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ExpansionTileDemo'),),
      body: Center(
        child: ExpansionTile(// 可扩展的小瓦片
          title: Text('Expansion Tile'),// 不展开时显示的文本
          leading: Icon(Icons.ac_unit),// 标题左边的图标
          backgroundColor: Colors.white12,// 展开后的背景颜色
          children: <Widget>[
            ListTile(
              title: Text('list titl'),// 标题
              subtitle: Text('subtitle'),// 子标题
            ),
          ],
          initiallyExpanded: true,// 默认打开状态的设置，默认值为false
        ),
      ),
    );
  }
}