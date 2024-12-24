import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/model/income_model.dart';
import 'package:expense_tracker/utils/colors.dart';
import 'package:expense_tracker/utils/measurements.dart';
import 'package:expense_tracker/widgets/budget_widgets/category_progress_card.dart';
import 'package:expense_tracker/widgets/budget_widgets/main_pie_chart.dart';
import 'package:flutter/material.dart';

class BudgetView extends StatefulWidget {
  final Map<ExpenseCategory, double> expenseCategoryWithTotal;
  final Map<IncomeCategory, double> incomeCategoryWithTotal;
  const BudgetView({
    super.key,
    required this.expenseCategoryWithTotal,
    required this.incomeCategoryWithTotal,
  });

  @override
  State<BudgetView> createState() => _BudgetViewState();
}

class _BudgetViewState extends State<BudgetView> {
  int selectedSubmenuIndex = 0;

  Color getColorByCategory(dynamic category) {
    if (category is ExpenseCategory) {
      return expenseCategoryToColor[category]!;
    } else {
      return incomeCategoryToColor[category]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final incomeExpenseMap = selectedSubmenuIndex == 0
        ? widget.expenseCategoryWithTotal
        : widget.incomeCategoryWithTotal;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Financial Report",
          style: TextStyle(
            color: kBlack,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                //* Expense income submenu
                Container(
                  decoration: BoxDecoration(
                    color: kMainColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(120),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSubmenuIndex = 0;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: defaultPadding / 4),
                          width: MediaQuery.sizeOf(context).width * 0.44,
                          decoration: BoxDecoration(
                            color: selectedSubmenuIndex == 0
                                ? kMainColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(120),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Expense",
                            style: TextStyle(
                              color:
                                  selectedSubmenuIndex == 0 ? kWhite : kBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSubmenuIndex = 1;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: defaultPadding / 4),
                          width: MediaQuery.sizeOf(context).width * 0.44,
                          decoration: BoxDecoration(
                            color: selectedSubmenuIndex == 1
                                ? kMainColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(120),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Income",
                            style: TextStyle(
                              color:
                                  selectedSubmenuIndex == 1 ? kWhite : kBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                //* Pie chart section
                MainPieChart(
                  expenseCategoryWithTotal: widget.expenseCategoryWithTotal,
                  incomeCategoryWithTotal: widget.incomeCategoryWithTotal,
                  isExpense: selectedSubmenuIndex == 0,
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.36,
                  child: SingleChildScrollView(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: selectedSubmenuIndex == 0
                            ? widget.expenseCategoryWithTotal.length
                            : widget.incomeCategoryWithTotal.length,
                        itemBuilder: (context, index) {
                          final categoryElement =
                              incomeExpenseMap.keys.toList()[index];
                          final categoryTotal =
                              incomeExpenseMap.values.toList()[index];
                          return CategoryProgressCard(
                            title: categoryElement.name,
                            amount: categoryTotal,
                            total: incomeExpenseMap.values
                                .reduce((value, element) => value + element),
                            progressFillColor:
                                getColorByCategory(categoryElement),
                            isExpense: selectedSubmenuIndex == 0,
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
