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
        body: SingleChildScrollView(
            child: Column(
          // crossAxisAlignment:CrossAxisAlignment.start ,
          children: [
            pageWidget(),
            SizedBox(
              height: 20,
            ),
            stackWidget(),
            SizedBox(
              height: 120,
            ),
            IndexedStackWidget(),
          ],
        )));
  }

  Widget pageWidget() {
    return Container(
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
                showTipsDialog(context, strings[index], isIos: index % 2 == 0);
              },
            );
          }),
    );
  }

  Widget stackWidget() {
    return Stack(
      overflow: Overflow.visible, // visible子控件超出部分总是显示，默认是裁剪
      alignment: Alignment.center,
      children: [
        Container(
          height: 100,
          width: 100,
          color: Colors.pink,
        ),
        Container(
          height: 75,
          width: 75,
          color: Colors.yellow,
        ),
        Container(
          height: 50,
          width: 50,
          color: Colors.blue,
        ),
        Positioned(
            left: 75,
            top: 75,
            height: 100,
            width: 100,
            child: Container(
              color: Colors.green,
              alignment: Alignment.center,
              child: Text(
                'Positioned控件',
                style: TextStyle(fontSize: 12),
              ),
            )),
        Text('测试Stack'),
      ],
    );
  }
}

class IndexedStackWidget extends StatefulWidget {
  IndexedStackWidget({Key key}) : super(key: key);

  @override
  _IndexedStackWidgetState createState() => _IndexedStackWidgetState();
}

class _IndexedStackWidgetState extends State<IndexedStackWidget> {
  var _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: [
          Text('测试IndexedStack'),
          IndexedStack(
            index: _index,
            children: [
              Center(
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                ),
              ),
              Center(
                child: Container(
                  height: 120,
                  width: 120,
                  color: Colors.blue,
                ),
              ),
              Center(
                child: Container(
                  height: 130,
                  width: 130,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.access_alarm),
                onPressed: () {
                  setState(() {
                    _index = 0;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.access_time),
                onPressed: () {
                  setState(() {
                    _index = 1;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.account_balance),
                onPressed: () {
                  setState(() {
                    _index = 2;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
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
