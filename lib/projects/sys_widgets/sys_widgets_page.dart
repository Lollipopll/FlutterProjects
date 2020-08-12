import 'package:flutter/material.dart';
import 'package:our_app/projects/sys_widgets/widgets/draggable_widget.dart';

class SysWidgetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SysWidgetsPage'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DraggableWidget(),// 拖拽Widget
          ],


        ),
      ),
    );
  }
}
