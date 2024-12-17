import 'package:expense_tracker/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color buttonBgColor;

  const CustomButton({
    super.key,
    required this.buttonText,
    required this.buttonBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        color: buttonBgColor,
        borderRadius: BorderRadius.circular(120),
      ),
      child: Center(
        child: Text(
          buttonText,
          style: const TextStyle(
            color: kWhite,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
