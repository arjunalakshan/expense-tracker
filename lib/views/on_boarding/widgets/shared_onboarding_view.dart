import 'package:expense_tracker/utils/colors.dart';
import 'package:expense_tracker/utils/measurements.dart';
import 'package:flutter/material.dart';

class SharedOnboardingView extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String shortDescription;

  const SharedOnboardingView({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.shortDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imageUrl,
          width: 150,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: defaultPadding / 2,
        ),
        Text(
          title,
          style: const TextStyle(
            color: kBlack,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: defaultPadding / 2,
        ),
        Text(
          shortDescription,
          style: const TextStyle(
            color: kGrey,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
