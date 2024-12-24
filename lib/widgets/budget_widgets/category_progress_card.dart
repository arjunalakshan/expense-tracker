import 'package:expense_tracker/utils/colors.dart';
import 'package:flutter/material.dart';

class CategoryProgressCard extends StatefulWidget {
  final String title;
  final double amount;
  final double total;
  final Color progressFillColor;
  final bool isExpense;

  const CategoryProgressCard({
    super.key,
    required this.title,
    required this.amount,
    required this.total,
    required this.progressFillColor,
    required this.isExpense,
  });

  @override
  State<CategoryProgressCard> createState() => _CategoryProgressCardState();
}

class _CategoryProgressCardState extends State<CategoryProgressCard> {
  @override
  Widget build(BuildContext context) {
    double progressAmount = widget.total != 0
        ? MediaQuery.sizeOf(context).width * (widget.amount / widget.total)
        : 0;

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: widget.progressFillColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: kLightGrey,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: widget.progressFillColor,
                        borderRadius: BorderRadius.circular(120),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        color: kBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "${(widget.amount / widget.total * 100).toStringAsFixed(0)}%",
                      style: const TextStyle(
                        color: kBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                widget.isExpense
                    ? "- \$ ${widget.amount.toStringAsFixed(2)}"
                    : "+ \$ ${widget.amount.toStringAsFixed(2)}",
                style: TextStyle(
                  color: widget.isExpense ? kRed : kGreen,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 10,
            width: progressAmount,
            decoration: BoxDecoration(
              color: widget.progressFillColor,
              borderRadius: BorderRadius.circular(120),
            ),
          ),
        ],
      ),
    );
  }
}
