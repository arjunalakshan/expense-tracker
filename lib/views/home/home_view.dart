import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/model/income_model.dart';
import 'package:expense_tracker/services/get_user_data_service.dart';
import 'package:expense_tracker/utils/colors.dart';
import 'package:expense_tracker/utils/measurements.dart';
import 'package:expense_tracker/widgets/home_widgets/income_expense_overview_card.dart';
import 'package:expense_tracker/widgets/home_widgets/overview_line_chart.dart';
import 'package:expense_tracker/widgets/transaction_widgets/expense_card.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  final List<ExpenseModel> expenseList;
  final List<IncomeModel> incomeList;
  const HomeView({
    super.key,
    required this.expenseList,
    required this.incomeList,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String userName = "";
  double totalIncome = 0;
  double totalExpense = 0;

  @override
  void initState() {
    //* Get username from shared preferences
    GetUserDataService.getUserData().then((value) {
      if (value["username"] != null) {
        setState(() {
          userName = value["username"]!;
        });
      }
    });

    //* Calculate the total income and expense
    setState(() {
      for (var expenseEliment in widget.expenseList) {
        totalExpense += expenseEliment.amount;
      }

      for (var incomeElimet in widget.incomeList) {
        totalIncome += incomeElimet.amount;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //* Main Column
            children: [
              Container(
                padding: const EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                  color: kMainColor.withOpacity(0.37),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  //* Sub Column for Overview section
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(120),
                            border: Border.all(
                              color: kMainColor,
                              width: 2,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(120),
                            child: Image.asset(
                              "assets/images/profile_placeholder.jpg",
                              width: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Welcome $userName",
                          style: const TextStyle(
                            fontSize: 16,
                            color: kBlack,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_rounded,
                            color: kMainColor,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 96,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IncomeExpenseOverviewCard(
                          title: "Income",
                          leadingIcon: Icons.arrow_downward_rounded,
                          cardBgColor: kGreen,
                          amount: totalIncome,
                        ),
                        IncomeExpenseOverviewCard(
                          title: "Expense",
                          leadingIcon: Icons.arrow_upward_rounded,
                          cardBgColor: kRed,
                          amount: totalExpense,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Spend frequency",
                      style: TextStyle(
                        fontSize: 16,
                        color: kBlack,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    OverviewLineChart(),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      "Recent Transactions",
                      style: TextStyle(
                        fontSize: 16,
                        color: kBlack,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    widget.expenseList.isEmpty
                        ? const Text(
                            "No transactions yet",
                            style: TextStyle(
                              fontSize: 14,
                              color: kGrey,
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.expenseList.length,
                            itemBuilder: (context, index) {
                              final expense = widget.expenseList[index];
                              return ExpenseCard(
                                title: expense.title,
                                amount: expense.amount,
                                date: expense.date,
                                category: expense.category,
                                note: expense.note,
                                createdAt: expense.time,
                              );
                            },
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
