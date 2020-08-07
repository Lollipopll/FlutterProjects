import 'package:flutter/widgets.dart';

/// Provider使用：
/// 第一种：类似setState会刷新context所在的所有节点
/// 通过final counter = Provider.of<CounterNotifier>(context); 获取引用对象【所有页面获取的都是同一个，类似android中同一个acitvity对应同一个ViewModel】
/// 改变数据后要通过 notifyListeners(); 方法通知其他引用处
/// 第二种：只刷新局部节点
/// 使用Consumer0~6创建监听节点
/// 通过 Provider.of<CounterNotifier>(context, listen: false).increment();创建目标provider调用方法，这里false意思是不监听改变，也就是通过这样创建的provider不会接收改变

class CounterNotifier extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  increment() {
    _count++;
    notifyListeners();
  }
}
