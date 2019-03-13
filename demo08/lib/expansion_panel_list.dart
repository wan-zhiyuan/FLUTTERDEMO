import 'package:flutter/material.dart';

class ExpansionPanelListDemo extends StatefulWidget {
 
  _ExpansionPanelListDemoState createState() => _ExpansionPanelListDemoState();
}

class _ExpansionPanelListDemoState extends State<ExpansionPanelListDemo> {
  
  List<int> mList;
  List<ExpandStateBean> expandStateList;
  _ExpansionPanelListDemoState(){
    mList = new List();
    expandStateList = new List();
    // for循环，给两个集合添加数据
    for (var i = 0; i < 10; i++) {
      mList.add(i);
      expandStateList.add(ExpandStateBean(i,false));
    }
  }
  
  _setCurrentIndex(int index,isExpand){
    setState(() {
      expandStateList.forEach((item){// 遍历数组
        if(item.index == index){// 如果遍历到了item位置与点击的index一致，则执行里面的方法
          item.isOpen = !isExpand;// 对当前状态取反
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text('expansion panel list'),),
       // ExpandsionPanelList必须放到可滚动的Widget下面
       body: SingleChildScrollView(
         child: ExpansionPanelList(
           expansionCallback: (index,bol){// 回调方法
            _setCurrentIndex(index, bol);
           },
           children: mList.map((index){
            return ExpansionPanel(
              headerBuilder: (context,isExpanded){
                return ListTile(
                  title: Text('This is No.$index'),
                );
              },
              body: ListTile(
                title: Text('expansion no.$index'),
              ),
              isExpanded: expandStateList[index].isOpen,
            );
           }).toList(),
         ),
       ),
    );
  }
}

// 申明一个控制打开和关闭状态的类
class ExpandStateBean{
  var isOpen;
  var index;
  ExpandStateBean(this.index,this.isOpen);
}