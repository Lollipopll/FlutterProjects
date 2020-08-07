import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider_page/counter_notifier.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterNotifier>(context);
    print(counter.hashCode);

    return Scaffold(
      appBar: AppBar(
        title: Text("loginPage"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  icon: Icon(Icons.text_fields),
                  labelText: "请输入手机号"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  icon: Icon(Icons.text_fields),
                  labelText: "请输入密码"),
            ),
            RaisedButton(
              child: Text("登陆"),
              onPressed: _login,
            ),
            Text('Text From CounterProvider: ${counter.count}')
          ],
        ),
      ),
    );
  }

  void _login() {
    print({'phone': phoneController.text});
  }
}
