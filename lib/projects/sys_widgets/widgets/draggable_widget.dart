import 'package:flutter/material.dart';
import 'package:our_app/projects/sys_widgets/widgets/title_view.dart';

/// 拖拽Widget Draggable
/// 参考 https://juejin.im/post/6844904086635020296
class DraggableWidget extends StatefulWidget {
  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  var _dragData;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          TitleView(
            "DraggableWidget",
            isTopMargin: false,
          ),
          _buildDraggable(),
          SizedBox(
            height: 30,
          ),
          DragTarget(
            builder: (BuildContext context, List<Color> candiadateData,
                List<dynamic> rejectedData) {
              return _dragData == null
                  ? Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.red)),
                    )
                  : Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'data',
                      ),
                    );
            },
            // 拖拽结束后是否接受，true-触发onAccept false-触发onLeave
            onWillAccept: (Color color) {
              return true;
            },
            onAccept: (Color color) {
              setState(() {
                _dragData = color;
              });
            },
            onLeave: (Object color) {},
          ),
        ],
      ),
    );
  }

  _buildDraggable() {
    // 拖拽控件
    return Draggable(
        data: Color(0x000000FF),
        // child是原控件
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10)),
          child: Text('data'),
        ),
        // feedback是拖拽时跟随的控件
        feedback: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10)),
          child: Text('data'),
        ));
  }
}
