import 'package:flutter/material.dart';
class TitleView extends StatelessWidget {
  final String title;
   bool isTopMargin;
  TitleView(this.title,{this.isTopMargin=true});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left:16),
      margin: EdgeInsets.only(top:isTopMargin?20:0,bottom:20),
      color: Colors.grey[300],
      child: Text(title),
      
    );
  }
}