import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder{
  final Widget widget;

  CustomRoute(this.widget)
  :super(
    transitionDuration:Duration(seconds:1),// 动画持续的时间
    pageBuilder:(
      BuildContext context,
      Animation<double> animation1,
      Animation<double> animation2,
    ){
      return widget;
    },
    transitionsBuilder:(
      BuildContext context,
      Animation<double> animation1,
      Animation<double> animation2,
      Widget child
    ){
      // 渐隐渐显的动画效果
      // return FadeTransition(  // FadeTransition渐隐渐显过度效果
      //   opacity:Tween(begin: 0.0,end: 1.0)
      //   .animate(CurvedAnimation( // .animate动画样式，一般使用动画曲线组件CurvedAnimation
      //     parent:animation1,
      //     curve:Curves.fastOutSlowIn,// 动画曲线：快出慢近；设置动画节奏
      //   )),
      //   child: child,
      // );
      // 缩放的动画效果
      // return ScaleTransition(
      //   scale: Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(// 0.0到1.0 表示从没有缩放到有
      //     parent: animation1,
      //     curve: Curves.fastOutSlowIn,
      //   )),
      //   child: child,
      // );

      // 旋转+缩放的动画效果
      // return RotationTransition(
      //   turns: Tween(begin: 0.0,end: 1.0)
      //   .animate(CurvedAnimation(
      //     parent:animation1,
      //     curve:Curves.fastOutSlowIn
      //   )),
      //   child: ScaleTransition(
      //     scale: Tween(begin: 0.0,end: 1.0)
      //     .animate(CurvedAnimation(
      //       parent:animation1,
      //       curve: Curves.fastOutSlowIn 
      //       )),
      //       child: child,
      //   ),
      // );

      // 左右滑动路由动画
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(-1.0, 0.0),
          end: Offset(0.0, 0.0)
        )
        .animate(CurvedAnimation(
          parent: animation1,
          curve: Curves.fastOutSlowIn,
        )),
        child: child,
      );
    }
  );

}