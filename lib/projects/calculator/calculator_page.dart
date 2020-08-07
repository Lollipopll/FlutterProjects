import 'package:flutter/material.dart';
import 'package:our_app/projects/calculator/widgets/calculator_view.dart';

class CalaulatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CalaulatorPage'),
      ),
      body: Center(
        child: CalculatorView(),
      ),
    );
  }
}
