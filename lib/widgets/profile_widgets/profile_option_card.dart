import 'package:expense_tracker/utils/colors.dart';
import 'package:flutter/material.dart';

class ProfileOptionCard extends StatelessWidget {
  final String title;
  final IconData leadIcon;
  final Color iconColor;
  const ProfileOptionCard({
    super.key,
    required this.title,
    required this.leadIcon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, left: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              leadIcon,
              color: iconColor,
              size: 40,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            title,
            style: const TextStyle(
              color: kBlack,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
