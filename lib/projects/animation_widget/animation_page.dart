import 'package:flutter/material.dart';
import 'package:our_app/projects/animation_widget/widgets/count_down_button.dart';
import 'package:our_app/projects/sys_widgets/widgets/title_view.dart';

//// 动画的使用 参考：https://juejin.im/post/6844904114233540621
///
class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with TickerProviderStateMixin {
  AnimationController _countDownController;

  bool _isClick=false;

  @override
  void initState() {
    super.initState();
    _countDownController =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..forward();
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
      body: SingleChildScrollView(
        child: Column(children: [
          TitleView(
            'CountDownButton',
            isTopMargin: false,
          ),
          CountDownButton(
              animation:
                  StepTween(begin: 5, end: 0).animate(_countDownController),
              doFunction: () {
                print("打开新的页面");
              }),
          TitleView('CountDownButton'),
         
        ]),
      ),
    );
  }
}
