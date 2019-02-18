import 'package:flutter/material.dart';
import 'index.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  Timer _timer;
  int _seconds;
  void initState() { 
    super.initState();
    _seconds = 3;
    _controller = AnimationController(vsync:this,duration:Duration(milliseconds: 2000));
    _animation = Tween(begin: 0.0,end:1.0).animate(_controller);
    /*动画事件监听器，
    它可以监听到动画的执行状态，
    我们这里只监听动画是否结束，
    如果结束则执行页面跳转动作。 */
    _animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        // print('加载完毕');
        _goMain();
      }
    });
    //播放动画
    _controller.forward();
    //启动计时器
    // startTime();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //销毁函数
  void _goMain() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => MyApp()), 
      (route)=> route==null);
  }

  //计时器
  void startTime() {
    // 设置启动图生效时间
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
      if (_seconds == 0) {
        print('到了');
        return;
      }
      _seconds--;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var stack = new Stack(
      alignment: const FractionalOffset(0.0, 0.0),
      children: <Widget>[
        Image.asset(
          'images/image1.jpg',
          scale: 1.0,
          fit: BoxFit.cover,
          height: 2000.0,
        ),
        new Positioned(
          top: 40.0,
          right: 25.0,
          width: 80.0,
          child: RaisedButton(
            onPressed: () {
              _goMain();
            },
            color: Colors.blueAccent,
            child: Text(
              // "跳过$_seconds",
              "跳过",
              style: TextStyle(
                color: Colors.white
              ),
            ),
          )
        )
      ],
    );

    return FadeTransition( //透明度动画组件
      opacity: _animation,  //执行动画
      // child: Image.asset(
      //   'images/image1.jpg',
      //   scale: 1.0,  //进行缩放
      //   fit: BoxFit.cover  // 充满父容器
      // )
      child: stack,
    );
  }
}