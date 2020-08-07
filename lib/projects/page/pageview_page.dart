import 'package:flutter/material.dart';

/// PageView实现滚动，ShaderMask实现渐变色
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
                    text: strings[index]);
              }),
        ));
  }
}

/// PageView的ItemView
class PageItem extends StatelessWidget {
  final Color bgColor;
  final int index;
  final String text;

  const PageItem({
    Key key,
    @required this.index,
    @required this.bgColor,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8, top: 30),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: ShaderMaskText(text: text),
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
