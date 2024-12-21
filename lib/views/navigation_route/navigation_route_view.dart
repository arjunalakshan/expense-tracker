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

  @override
  Widget build(BuildContext context) {
    final List<Widget> mainViews = [
      AddNewView(),
      HomeView(),
      TransactionView(),
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
