import 'package:calculator/bloc/calculation_bloc.dart';
import 'package:calculator/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculationText extends StatelessWidget {
  const CalculationText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculationBloc, CalculationState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                context.read<CalculationBloc>().prevData,
                style: TextStyle(
                  fontSize: 32,
                  color: kSecondaryColor.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                context.read<CalculationBloc>().data,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
