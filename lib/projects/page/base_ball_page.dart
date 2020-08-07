import 'package:flutter/material.dart';
import 'package:our_app/projects/page/widget/base_ball_view.dart';

class BaseBallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("BaseBallPage"),
      ),
      body: _DemonstrateView(),
    );
  }
}

class _DemonstrateView extends StatefulWidget {
  @override
  __DemonstrateViewState createState() => __DemonstrateViewState();
}

class __DemonstrateViewState extends State<_DemonstrateView>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);

    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {
          print("${_animation.value}");

          // if (_animationController.isCompleted) {
          //   print("addListener--->Completed");
          // }
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          print("addStatusListener--->Completed");
          Future.delayed(Duration(milliseconds: 400)).then((value) {
            _animationController.reset();
          });
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.blueAccent,
            padding: const EdgeInsets.only(left: 30, top: 30),
            child: CustomPaint(
              size: Size(180, 90),
              painter: BaseBallView(
                  radius: 30,
                  percent: _animation.value,
                  isToRight: true,
                  color: Colors.deepOrange),
            ),
          ),
          Container(
            color: Colors.yellowAccent,
            padding: const EdgeInsets.only(left: 120, top: 30),
            child: CustomPaint(
              size: Size(90, 90),
              painter: BaseBallView(
                  radius: 30,
                  percent: _animation.value,
                  isToRight: false,
                  color: Colors.blueAccent),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: OutlineButton(
              child: Text(
                "轮播图指示器",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              onPressed: () => _animationController.forward(),
            ),
          )
        ],
      ),
    );
  }
}
