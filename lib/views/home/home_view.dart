import 'package:expense_tracker/services/get_user_data_service.dart';
import 'package:expense_tracker/utils/colors.dart';
import 'package:expense_tracker/utils/measurements.dart';
import 'package:expense_tracker/widgets/home_widgets/income_expense_overview_card.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //* Store the username from shared preferences
  String userName = "";
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Text(
                          "Welcome $userName",
                          style: const TextStyle(
                            fontSize: 16,
                            color: kBlack,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
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
                          amount: 2000,
                        ),
                        IncomeExpenseOverviewCard(
                          title: "Expense",
                          leadingIcon: Icons.arrow_upward_rounded,
                          cardBgColor: kRed,
                          amount: 2000,
                        ),
                      ],
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
