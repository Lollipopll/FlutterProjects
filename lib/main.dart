import 'package:flutter/material.dart';
import 'package:our_app/projects/calculator/calculator_page.dart';
import 'package:our_app/projects/page/animation_page.dart';
import 'package:our_app/projects/page/base_ball_page.dart';
import 'package:our_app/projects/page/bezier_page.dart';
import 'package:our_app/projects/page/card_page.dart';
import 'package:our_app/projects/page/login_page.dart';
import 'package:our_app/projects/page/provider_page/counter_notifier.dart';
import 'package:our_app/projects/page/provider_page/counter_page.dart';
import 'package:our_app/projects/page/shimmer_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class RouterCenter {
  static const router_login_page = "/loginPage";
  static const router_bezier_page = "/bezierPage";
  static const router_base_ball_page = "/baselBallPage";
  static const router_shimmer_page = "/shimmerPage";
  static const router_card_page = "/cardPage";
  static const router_animation_page = "/animationPage";
  static const router_counter_page = "/counterPage";
  static const router_calculator_page = "/calculatorPage";

  static final Map routers = <String, WidgetBuilder>{
    RouterCenter.router_login_page: (BuildContext context) => new LoginPage(),
    RouterCenter.router_bezier_page: (BuildContext context) => new BezierPage(),
    RouterCenter.router_base_ball_page: (BuildContext context) =>
        new BaseBallPage(),
    RouterCenter.router_shimmer_page: (BuildContext context) =>
        new ShimmerPage(),
    RouterCenter.router_card_page: (BuildContext context) => new CardPage(),
    RouterCenter.router_animation_page: (BuildContext context) =>
        new AnimationPage(),
    RouterCenter.router_counter_page: (BuildContext context) =>
        new CounterPage(),
    RouterCenter.router_calculator_page: (BuildContext context) =>
        new CalaulatorPage(),
  };
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 注册单个Provider
    // return ChangeNotifierProvider.value(
    //   value: CounterNotifier(),
    //   child: MyMaterialApp(),
    // );

    /// 注册多个provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: CounterNotifier(),
        )
      ],
      child: MyMaterialApp(),
    );
  }
}

/// 路由配置
class MyMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: RouterCenter.routers,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

/// 主页
class HomePage extends StatelessWidget {
  final List<MainListItem> listData = List();
  final listDataMap = {
    "loginPage": RouterCenter.router_login_page,
    "bezierPage": RouterCenter.router_bezier_page,
    "baselBallPage": RouterCenter.router_base_ball_page,
    "shimmerPage": RouterCenter.router_shimmer_page,
    "cardPage": RouterCenter.router_card_page,
    "animationPage": RouterCenter.router_animation_page,
    "counterPage": RouterCenter.router_counter_page,
    "calculatorPage": RouterCenter.router_calculator_page,
  };
  HomePage() {
    listDataMap.forEach((k, v) {
      var item = MainListItem()
        ..itemName = k
        ..routerUrl = v;
      listData.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HomePage"),
        ),
        body: ListView.builder(
          itemCount: listData.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(listData[index].itemName),
              onTap: () {
                Navigator.of(context).pushNamed(listData[index].routerUrl);
              },
            );
          },
        ));
  }
}

/// 首页item实体类
class MainListItem {
  String itemName;
  String routerUrl;
}
