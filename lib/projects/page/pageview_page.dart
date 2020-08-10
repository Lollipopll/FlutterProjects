import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// PageView实现滚动，ShaderMask实现渐变色，Dialog弹窗
class PageViewPage extends StatelessWidget {
  final bgColors = [Colors.orange, Colors.pink, Colors.blue];
  final strings = ["这是第一页", "这是第二页", "这是第三页"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PageView"),
        ),
        body: Container(
          height: 230,
          child: PageView.builder(
              scrollDirection: Axis.horizontal, // 滚动方向
              controller: PageController(
                // 控制器
                initialPage: 1, //默认初始位置
                viewportFraction: 0.9, //视察因子
              ),
              onPageChanged: (int index) {
                // 滚动监听
                print("当前page $index");
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return PageItem(
                  index: index,
                  bgColor: bgColors[index],
                  text: strings[index],
                  onTap: () {
                    showTipsDialog(context, strings[index],
                        isIos: index % 2 == 0);
                  },
                );
              }),
        ));
  }

  /// 展示Dialog弹窗
  void showTipsDialog(BuildContext context, String content,
      {bool isIos = false}) {
    if (isIos) {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text('这是title'),
              content: Text(content),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop('cancel');
                    },
                    child: Text('取消')),
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop('ok');
                    },
                    child: Text('确定'))
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('这是title'),
              content: Text(content),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop('cancel');
                    },
                    child: Text('取消')),
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop('ok');
                    },
                    child: Text('确定'))
              ],
            );
          });
    }
  }
}

/// PageView的ItemView
class PageItem extends StatelessWidget {
  final Color bgColor;
  final int index;
  final String text;
  final GestureTapCallback onTap;

  const PageItem({
    Key key,
    @required this.index,
    @required this.bgColor,
    @required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 8, right: 8, top: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: ShaderMaskText(text: text),
      ),
    );
  }
}

/// 带有渐变色的TextView
class ShaderMaskText extends StatelessWidget {
  const ShaderMaskText({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    // 通过ShaderMask实现渐变色，ShaderMask可以将Shader用于任何控件上
    return ShaderMask(
        shaderCallback: (Rect bounds) {
          return RadialGradient(
                  center: Alignment.center,
                  radius: 1.0,
                  colors: <Color>[Colors.yellow, Colors.deepOrange],
                  tileMode: TileMode.mirror)
              .createShader(bounds);
        },
        blendMode: BlendMode.srcATop,
        child: Text(
          text,
          style: TextStyle(fontSize: 30),
        ));
  }
}
