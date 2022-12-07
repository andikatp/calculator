import 'package:calculator/components/button_component.dart';
import 'package:flutter/material.dart';

import '../components/calculation_text_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  List<Widget> get row1 => [
        const ButtonComponent(
          text: 'C',
          textColor: Color(0xFFB94D2B),
        ),
        const ButtonComponent(
          text: '+/\u2212',
          fontSize: 32,
        ),
        const ButtonComponent(
          text: '%',
        ),
        const ButtonComponent(
          text: '\u00F7',
          fontSize: 44,
          fontWeight: FontWeight.normal,
        ),
      ];

  List<Widget> get row2 => [
        for (String i in ['1', '2', '3'])
          ButtonComponent(
            text: i,
            shape: Shape.circle,
          ),
        const ButtonComponent(
          text: '\u00D7',
          fontSize: 52,
          fontWeight: FontWeight.normal,
        )
      ];

  List<Widget> get row3 => [
        for (String i in ['4', '5', '6'])
          ButtonComponent(
            text: i,
            shape: Shape.circle,
          ),
        const ButtonComponent(
          text: '\u2212',
          fontSize: 52,
          fontWeight: FontWeight.normal,
        )
      ];

  List<Widget> get row4 => [
        for (String i in ['7', '8', '9'])
          ButtonComponent(
            text: i,
            shape: Shape.circle,
          ),
        const ButtonComponent(
          text: '+',
          fontSize: 52,
          fontWeight: FontWeight.normal,
        )
      ];

  List<Widget> get row5 => [
        const ButtonComponent(
          text: '0',
          width: 156,
          shape: Shape.stadium,
        ),
        const ButtonComponent(
          text: '.',
          fontSize: 52,
          fontWeight: FontWeight.normal,
        ),
        const ButtonComponent(
          text: '=',
          fontSize: 52,
          fontWeight: FontWeight.normal,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final rows = [row1, row2, row3, row4, row5];
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.08),
            child: const CalculationText(),
          ),
          const Spacer(),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: rows[index],
            ),
            separatorBuilder: (_, __) =>
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            itemCount: rows.length,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
        ],
      ),
    );
  }
}
