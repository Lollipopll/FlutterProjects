import 'package:flutter/material.dart';
import 'package:our_app/projects/sys_widgets/widgets/title_view.dart';

class StepWidget extends StatefulWidget {
  @override
  _StepWidgetState createState() => _StepWidgetState();
}

class _StepWidgetState extends State<StepWidget> {
  int _currentStepIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleView('Stepper'),
        Stepper(
            currentStep: _currentStepIndex,
            // 点击切换选中的Step
            onStepTapped: (index) {
              setState(() {
                _currentStepIndex = index;
              });
            },
            onStepContinue: () {
              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(SnackBar(content: Text('确定')));
            },
            onStepCancel: () {
              // 展示之前先取消，不然会排进队列中延迟加载，表现卡顿
              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(SnackBar(content: Text('取消')));
            },
            // 去除每个Step默认带的continue和cancel按钮
            controlsBuilder: (context, {onStepContinue, onStepCancel}) {
              return Row(
                children: [
                  FlatButton(
                    child: Text('完成'),
                    onPressed: onStepContinue,
                  ),
                  FlatButton(
                    child: Text('取消'),
                    onPressed: onStepCancel,
                  ),
                ],
              );
            },
            steps: [
              // 样式固定的Step
              Step(
                  title: Text('第一个 title'),
                  subtitle: Text('第一个 副标题'),
                  content: Text('第一个 content')),
              Step(
                  title: Text('第二个 title'),
                  subtitle: Text('第二个 副标题'),
                  content: Text('第二个 content')),
              Step(
                  title: Text('第三个 title'),
                  subtitle: Text('第三个 副标题'),
                  content: Text('第三个 content')),
            ]),
      ],
    );
  }
}
