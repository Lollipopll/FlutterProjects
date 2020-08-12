import 'package:flutter/material.dart';
class TitleView extends StatelessWidget {
  final String title;
  TitleView(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left:16),
      margin: EdgeInsets.only(top:10,bottom:10),
      color: Colors.grey[300],
      child: Text(title),
      
    );
  }
}