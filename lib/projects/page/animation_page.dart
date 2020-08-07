import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with TickerProviderStateMixin {
  AnimationController _countDownController;

  @override
  void initState() {
    super.initState();
    _countDownController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _countDownController.forward();
  }

  @override
  void dispose() {
    _countDownController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimationPage"),
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: CountDownButton(
          context: context,
          animation: StepTween(begin: 5, end: 0).animate(_countDownController),
          doFunction: _nextPage,
        ),
      ),
    );
  }

  void _nextPage(BuildContext context) {
    print("打开新的页面" + context.toString());
  }
}

/// 通用的只有一个context的方法类型
typedef DoFunction = void Function(BuildContext context);

class CountDownButton extends AnimatedWidget {
  final Animation<int> animation;
  final DoFunction doFunction;
  CountDownButton({key, this.animation, this.doFunction, context})
      : super(key: key, listenable: animation) {
    this.animation.addStatusListener((state) {
      if (state == AnimationStatus.completed) {
        // nextPage(context);
        doFunction(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var value = this.animation.value + 1;
    return InkWell(
      onTap: () {
        doFunction(context);
      },
      child: Container(
        alignment: Alignment.center,
        width: 80,
        height: 30,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            border: Border.all(width: 2.0, color: Colors.red)),
        child: Text(
          (value == 0 ? "" : '$value | 跳过'),
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
