import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/model/income_model.dart';
import 'package:expense_tracker/services/expense_type_service.dart';
import 'package:expense_tracker/services/income_type_service.dart';
import 'package:expense_tracker/utils/colors.dart';
import 'package:expense_tracker/utils/measurements.dart';
import 'package:expense_tracker/views/add_new/add_new_view.dart';
import 'package:expense_tracker/views/budget/budget_view.dart';
import 'package:expense_tracker/views/home/home_view.dart';
import 'package:expense_tracker/views/profile/profile_view.dart';
import 'package:expense_tracker/views/transaction/transaction_view.dart';
import 'package:flutter/material.dart';

class NavigationRouteView extends StatefulWidget {
  const NavigationRouteView({super.key});

  @override
  State<NavigationRouteView> createState() => _NavigationRouteViewState();
}

class _NavigationRouteViewState extends State<NavigationRouteView> {
  int _currentViewIndex = 0;
  List<ExpenseModel> expenseList = [];
  List<IncomeModel> incomeList = [];

  //* Fetch expense from shared preference
  void fetchExpenseFromSharedPreference() async {
    List<ExpenseModel> expenseList = await ExpenseTypeService().getExpense();
    setState(() {
      this.expenseList = expenseList;
    });
  }

  //* Add expense
  void addNewExpense(ExpenseModel expense) async {
    ExpenseTypeService().saveExpense(expense, context);

    //* Update the state
    setState(() {
      expenseList.add(expense);
    });
  }

  //* Fetch income from shared preference
  void fetchIncomeFromSharedPreference() async {
    List<IncomeModel> incomeList = await IncomeTypeService().getIncomeList();
    setState(() {
      this.incomeList = incomeList;
    });
  }

  //* Add income
  void addNewIncome(IncomeModel income) async {
    IncomeTypeService().saveIncome(income, context);

    //* Update the state
    setState(() {
      incomeList.add(income);
    });
  }

  //* Initialize the state
  @override
  void initState() {
    fetchExpenseFromSharedPreference();
    fetchIncomeFromSharedPreference();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> mainViews = [
      HomeView(),
      TransactionView(),
      AddNewView(
        addExpense: addNewExpense,
        addIncome: addNewIncome,
      ),
      BudgetView(),
      ProfileView(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kWhite,
        selectedItemColor: kMainColor,
        unselectedItemColor: kGrey,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        currentIndex: _currentViewIndex,
        onTap: (value) {
          setState(() {
            _currentViewIndex = value;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows_rounded),
            label: "Transaction",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(defaultPadding / 2),
              decoration: BoxDecoration(
                color: kMainColor,
                borderRadius: BorderRadius.circular(140),
              ),
              child: const Icon(
                Icons.add_rounded,
                color: kWhite,
                size: 30,
              ),
            ),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_rounded),
            label: "Budget",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: "Profile",
          ),
        ],
      ),
      body: mainViews[_currentViewIndex],
    );
  }
}
