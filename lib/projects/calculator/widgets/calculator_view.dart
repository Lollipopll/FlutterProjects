import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:our_app/projects/calculator/kcolors.dart';

import 'neu_calculator_button.dart';

class CalculatorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Text(
              '3670',
              style: GoogleFonts.montserrat(
                fontSize: 80,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          Spacer(),
          // SizedBox(height: 50),
          ButtonRow(children: [
            NeuCalculatorButton(text: 'AC'),
            NeuCalculatorButton(text: '+/-'),
            NeuCalculatorButton(text: '%'),
            NeuCalculatorButton(
              text: '/',
              textColor: kOrange,
            ),
          ]),
          ButtonRow(
            children: [
              NeuCalculatorButton(text: '7'),
              NeuCalculatorButton(text: '8'),
              NeuCalculatorButton(text: '9'),
              NeuCalculatorButton(
                text: 'x',
                textColor: kOrange,
              ),
            ],
          ),

          ButtonRow(
            children: [
              NeuCalculatorButton(text: '4'),
              NeuCalculatorButton(text: '5'),
              NeuCalculatorButton(text: '6'),
              NeuCalculatorButton(
                text: '-',
                textColor: kOrange,
              ),
            ],
          ),

          ButtonRow(
            children: [
              NeuCalculatorButton(text: '1'),
              NeuCalculatorButton(text: '2'),
              NeuCalculatorButton(text: '3'),
              NeuCalculatorButton(
                text: '+',
                textColor: kOrange,
              ),
            ],
          ),
          ButtonRow(
            children: [
              NeuCalculatorButton(
                text: '0',
                isPill: true,
              ),
              NeuCalculatorButton(text: '.'),
              NeuCalculatorButton(
                text: '=',
                textColor: kOrange,
              ),
            ],
          ),

          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          ),
        ]),
      ),
    );
  }
}

class ButtonRow extends StatelessWidget {
  const ButtonRow({
    Key key,
    @required this.children,
  }) : super(key: key);

  final List<NeuCalculatorButton> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }
}
