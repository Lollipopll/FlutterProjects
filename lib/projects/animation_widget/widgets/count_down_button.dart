import 'package:flutter/material.dart';

/// 通用的只有一个context的方法类型
typedef DoFunction = void Function();

class CountDownButton extends AnimatedWidget {
  final Animation<int> animation;
  final DoFunction doFunction;
  CountDownButton({key, this.animation, this.doFunction})
      : super(key: key, listenable: animation) {
    this.animation.addStatusListener((state) {
      if (state == AnimationStatus.completed) {
        // nextPage(context);
        doFunction();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var value = this.animation.value + 1;
    return InkWell(
      onTap: () {
        doFunction();
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
