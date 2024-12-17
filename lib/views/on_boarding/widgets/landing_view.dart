import 'package:expense_tracker/utils/colors.dart';
import 'package:expense_tracker/utils/measurements.dart';
import 'package:flutter/material.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/money-logo.png",
          width: 140,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: defaultPadding / 2,
        ),
        const Text(
          "ExpenseTracker",
          style: TextStyle(
            color: kMainColor,
            fontSize: 32,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
