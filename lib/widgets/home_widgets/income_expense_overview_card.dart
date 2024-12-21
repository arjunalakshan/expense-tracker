import 'package:expense_tracker/utils/colors.dart';
import 'package:expense_tracker/utils/measurements.dart';
import 'package:flutter/material.dart';

class IncomeExpenseOverviewCard extends StatefulWidget {
  final String title;
  final IconData leadingIcon;
  final double amount;
  final Color cardBgColor;
  const IncomeExpenseOverviewCard({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.amount,
    required this.cardBgColor,
  });

  @override
  State<IncomeExpenseOverviewCard> createState() =>
      _IncomeExpenseOverviewCardState();
}

class _IncomeExpenseOverviewCardState extends State<IncomeExpenseOverviewCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      width: MediaQuery.sizeOf(context).width * 0.43,
      decoration: BoxDecoration(
        color: widget.cardBgColor,
        borderRadius: BorderRadius.circular(defaultPadding),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(defaultPadding / 2),
            ),
            child: Icon(
              widget.leadingIcon,
              color: widget.cardBgColor,
              size: 48,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  color: kWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                "\$ ${widget.amount}",
                style: const TextStyle(
                  color: kWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
