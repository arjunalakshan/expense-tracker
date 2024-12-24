import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/model/income_model.dart';
import 'package:expense_tracker/utils/colors.dart';
import 'package:expense_tracker/utils/measurements.dart';
import 'package:expense_tracker/widgets/transaction_widgets/expense_card.dart';
import 'package:expense_tracker/widgets/transaction_widgets/income_card.dart';
import 'package:flutter/material.dart';

class TransactionView extends StatefulWidget {
  final List<ExpenseModel> expenseList;
  final List<IncomeModel> incomeList;
  final void Function(ExpenseModel) onDeleteExpense;
  final void Function(IncomeModel) onDeleteIncome;
  const TransactionView({
    super.key,
    required this.expenseList,
    required this.onDeleteExpense,
    required this.incomeList,
    required this.onDeleteIncome,
  });

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "See your financial report",
                style: TextStyle(
                  color: kMainColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              //* Expenses Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Expenses",
                      style: TextStyle(
                        color: kBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.35,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            widget.expenseList.isEmpty
                                ? const Text(
                                    "No expenses yet, add some expenses to see here",
                                    style: TextStyle(
                                      color: kGrey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(4),
                                    scrollDirection: Axis.vertical,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: widget.expenseList.length,
                                    itemBuilder: (context, index) {
                                      final expense = widget.expenseList[index];
                                      return Dismissible(
                                        background: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: const Icon(
                                            Icons.delete,
                                            color: kRed,
                                            size: 30,
                                          ),
                                        ),
                                        key: ValueKey(expense),
                                        direction: DismissDirection.startToEnd,
                                        onDismissed: (direction) {
                                          setState(() {
                                            widget.onDeleteExpense(expense);
                                          });
                                        },
                                        child: ExpenseCard(
                                          title: expense.title,
                                          amount: expense.amount,
                                          date: expense.date,
                                          category: expense.category,
                                          note: expense.note,
                                          createdAt: expense.time,
                                        ),
                                      );
                                    },
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //* Incomes Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Incomes",
                      style: TextStyle(
                        color: kBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.35,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            widget.incomeList.isEmpty
                                ? const Text(
                                    "No incomes yet, add some incomes to see here",
                                    style: TextStyle(
                                      color: kGrey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(4),
                                    scrollDirection: Axis.vertical,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: widget.incomeList.length,
                                    itemBuilder: (context, index) {
                                      final income = widget.incomeList[index];
                                      return Dismissible(
                                        background: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: const Icon(
                                            Icons.delete,
                                            color: kRed,
                                            size: 30,
                                          ),
                                        ),
                                        key: ValueKey(income),
                                        direction: DismissDirection.startToEnd,
                                        onDismissed: (direction) {
                                          setState(() {
                                            widget.onDeleteIncome(income);
                                          });
                                        },
                                        child: IncomeCard(
                                          title: income.title,
                                          amount: income.amount,
                                          date: income.date,
                                          category: income.category,
                                          note: income.note,
                                          createdAt: income.time,
                                        ),
                                      );
                                    },
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
