import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/model/income_model.dart';
import 'package:expense_tracker/utils/colors.dart';
import 'package:expense_tracker/utils/measurements.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MainPieChart extends StatefulWidget {
  final Map<ExpenseCategory, double> expenseCategoryWithTotal;
  final Map<IncomeCategory, double> incomeCategoryWithTotal;
  final bool isExpense;
  const MainPieChart({
    super.key,
    required this.expenseCategoryWithTotal,
    required this.incomeCategoryWithTotal,
    required this.isExpense,
  });

  @override
  State<MainPieChart> createState() => _MainPieChartState();
}

class _MainPieChartState extends State<MainPieChart> {
  //* Pie chart section data
  List<PieChartSectionData> getChartDataAsList() {
    if (widget.isExpense) {
      return [
        PieChartSectionData(
          color: expenseCategoryToColor[ExpenseCategory.food],
          value: widget.expenseCategoryWithTotal[ExpenseCategory.food] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: expenseCategoryToColor[ExpenseCategory.health],
          value: widget.expenseCategoryWithTotal[ExpenseCategory.health] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: expenseCategoryToColor[ExpenseCategory.shopping],
          value: widget.expenseCategoryWithTotal[ExpenseCategory.shopping] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: expenseCategoryToColor[ExpenseCategory.subscription],
          value:
              widget.expenseCategoryWithTotal[ExpenseCategory.subscription] ??
                  0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: expenseCategoryToColor[ExpenseCategory.transport],
          value:
              widget.expenseCategoryWithTotal[ExpenseCategory.transport] ?? 0,
          showTitle: false,
          radius: 60,
        ),
      ];
    } else {
      return [
        PieChartSectionData(
          color: incomeCategoryToColor[IncomeCategory.freelance],
          value: widget.incomeCategoryWithTotal[IncomeCategory.freelance] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: incomeCategoryToColor[IncomeCategory.passive],
          value: widget.incomeCategoryWithTotal[IncomeCategory.passive] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: incomeCategoryToColor[IncomeCategory.salary],
          value: widget.incomeCategoryWithTotal[IncomeCategory.salary] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: incomeCategoryToColor[IncomeCategory.sales],
          value: widget.incomeCategoryWithTotal[IncomeCategory.sales] ?? 0,
          showTitle: false,
          radius: 60,
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final PieChartData pieChartData = PieChartData(
      sectionsSpace: 0,
      centerSpaceRadius: 70,
      startDegreeOffset: -90,
      sections: getChartDataAsList(),
      borderData: FlBorderData(show: false),
    );

    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      height: 300,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(pieChartData),
          Text(
            "\$2000",
            style: TextStyle(
              color: kBlack,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
