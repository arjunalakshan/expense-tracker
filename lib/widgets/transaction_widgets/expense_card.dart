import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/utils/colors.dart';
import 'package:expense_tracker/utils/measurements.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseCard extends StatelessWidget {
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;
  final String note;
  final DateTime createdAt;
  const ExpenseCard({
    super.key,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    required this.note,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: defaultPadding / 2),
      padding: const EdgeInsets.all(defaultPadding),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: kGrey.withOpacity(0.4),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: expenseCategoryToColor[category]!.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: expenseCategoryToIcon[category]!,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: kBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: 90,
                      child: Text(
                        note,
                        style: const TextStyle(
                          color: kGrey,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "- \$${amount.toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: kRed,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "${DateFormat.yMMMd().format(date)} ${DateFormat.jm().format(createdAt)}",
                      style: const TextStyle(
                        color: kGrey,
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
