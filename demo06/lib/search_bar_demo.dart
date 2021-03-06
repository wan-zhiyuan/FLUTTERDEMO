import 'package:flutter/material.dart';
import 'assert.dart';

class SearchbarDemo extends StatefulWidget {

  _SearchbarDemoState createState() => _SearchbarDemoState();
}

class _SearchbarDemoState extends State<SearchbarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('SearchBarDemo'),
         actions: <Widget>[
           IconButton(
             icon: Icon(Icons.search),
             onPressed: (){
               showSearch(context:context,delegate:searchBarDelegate());
             },
           ),
         ],
       ),
    );
  }
}

class searchBarDelegate extends SearchDelegate<String>{

// buildActions方法，搜索条右侧的按钮执行方法
  @override
  List<Widget> buildActions(BuildContext context){
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";// 搜索内容置为空
        },
      ),
    ];
  }
// buildLeading方法，搜索栏左侧的图标和功能
  @override
  Widget buildLeading(BuildContext context){
    return IconButton(
      icon: AnimatedIcon(// 带动画的icon，效果不明显
        icon:AnimatedIcons.menu_arrow,progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);// 关闭上下文(即)
      },
    );
  }
// buildResults方法，搜索到内容后的展示
  @override
  Widget buildResults(BuildContext context){
    return Container(
      width: 100.0,
      height: 100.0,
      child: Card(
        color: Colors.redAccent,
        child: Center(
          child:Text(query),
        ), 
      ),
    );
  }

  // 设置推荐的内容（默认的推荐，关联推荐等等）
  @override
  Widget buildSuggestions(BuildContext context){
    final suggestionList = query.isEmpty
    ? recentSuggest
    : searchList.where((input) => input.startsWith(query)).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context,index){
        return ListTile(
          title: RichText(  // 富文本
            text: TextSpan(
              text:suggestionList[index].substring(0,query.length),
              style:TextStyle(
                color: Colors.black,fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style:TextStyle(color:Colors.grey),
                ),
              ]
            ),
          ),
        );
      },
    );



  }




}