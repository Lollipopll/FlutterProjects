import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //     body: SizedBox(
      //   width: 200.0,
      //   height: 100.0,
      //   child: Shimmer.fromColors(
      //     baseColor: Colors.blue,
      //     highlightColor: Colors.yellow,
      //     child: Text(
      //       'Shimmer',
      //       textAlign: TextAlign.center,
      //       style: TextStyle(
      //         fontSize: 40.0,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //   ),
      // )
      // );
      appBar: AppBar(
        title: Text("ShimmerPage"),
      ),
      body: SizedBox(
        child: Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.white,
          child: Column(
            children: <Widget>[
              CoinRankingListItemSkeleton(),
              CoinRankingListItemSkeleton(),
              CoinRankingListItemSkeleton(),
              CoinRankingListItemSkeleton(),
              CoinRankingListItemSkeleton(),
              CoinRankingListItemSkeleton(),
            ],
          ),
        ),
      ),
    );
  }
}

class CoinRankingListItemSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      height: 80.0,
      child: Row(
        children: <Widget>[
          Container(width: 100.0, height: 100.0, color: Colors.grey),
          SizedBox(width: 10.0),
          Expanded(
              child: Container(
            child: Column(
              children: <Widget>[
                Container(height: 10.0, color: Colors.grey),
                SizedBox(height: 10),
                Container(height: 10.0, color: Colors.grey),
                SizedBox(height: 10),
                Container(height: 10.0, color: Colors.grey),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(width: 50.0, height: 10.0, color: Colors.grey),
                    Container(width: 70.0, height: 10.0, color: Colors.grey),
                    Container(width: 20.0, height: 10.0, color: Colors.grey),
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
