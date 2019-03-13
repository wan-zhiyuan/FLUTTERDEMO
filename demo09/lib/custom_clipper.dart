import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(// 路径裁切控件
            clipper: BottomClipper2(),// 裁切的位置
            child: Container(
              color: Colors.deepPurpleAccent,
              height: 200.0,
            ),
          ),
        ],
      ),
    );
  }
}

// 二阶贝塞尔曲线绘制
class BottomClipper extends CustomClipper<Path>{
  
  @override
  Path getClip(Size size) {
    var path =Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height-50);
    var firstControlPoint = Offset(size.width/2,size.height);// 贝塞尔曲线控制点
    var firstEndPoint =Offset(size.width, size.height-50);// 贝塞尔曲线结束点
    path.quadraticBezierTo(
      firstControlPoint.dx, 
      firstControlPoint.dy, 
      firstEndPoint.dx, 
      firstEndPoint.dy);
    path.lineTo(size.width, size.height-50);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

// 波浪线绘制（两个贝塞尔曲线组合）
class BottomClipper2 extends CustomClipper<Path>{
  
  @override
  Path getClip(Size size) {
    var path = Path();
    
    path.lineTo(0, 0);
    path.lineTo(0, size.height-40);
    var firstControlPoint =Offset(size.width/4, size.height);
    var firstEndPoint =Offset(size.width/2,size.height-40);
    path.quadraticBezierTo(
      firstControlPoint.dx, 
      firstControlPoint.dy, 
      firstEndPoint.dx, 
      firstEndPoint.dy);
    var secondControlPoint =Offset(size.width*3/4,size.height-80);
    var secondeEndPoint =Offset(size.width, size.height-40);
    path.quadraticBezierTo(
      secondControlPoint.dx, 
      secondControlPoint.dy, 
      secondeEndPoint.dx, 
      secondeEndPoint.dy);
    
    path.lineTo(size.width, size.height-40);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}