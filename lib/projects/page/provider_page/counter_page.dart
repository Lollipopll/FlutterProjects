import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_notifier.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final counter1 = Provider.of<CounterNotifier>(context);
    // print(counter.hashCode);
    print('rebuild CounterPage refresh count');
    return Scaffold(
      appBar: AppBar(
        title: Text('CounterPage'),
      ),
      body: Center(
        child: Consumer<CounterNotifier>(builder: (context, counter, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('You have pushed the button this many times'),
              Text(
                '${counter.count}',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 不需要监听改变（listen: false 不会重新调用build）
          Provider.of<CounterNotifier>(context, listen: false).increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
