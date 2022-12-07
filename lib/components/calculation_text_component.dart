import 'package:calculator/utils/constants.dart';
import 'package:flutter/material.dart';

class CalculationText extends StatelessWidget {
  const CalculationText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            '0',
            style: TextStyle(
              fontSize: 32,
              color: kSecondaryColor.withOpacity(0.7),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),
        const FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            '0',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
