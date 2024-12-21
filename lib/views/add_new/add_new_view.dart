import 'package:expense_tracker/utils/colors.dart';
import 'package:expense_tracker/utils/measurements.dart';
import 'package:flutter/material.dart';

class AddNewView extends StatefulWidget {
  const AddNewView({super.key});

  @override
  State<AddNewView> createState() => _AddNewViewState();
}

class _AddNewViewState extends State<AddNewView> {
  int _selectedSubMenuIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedSubMenuIndex == 0 ? kRed : kGreen,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Stack(children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.05,
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(120),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedSubMenuIndex = 0;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding * 3,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color:
                              _selectedSubMenuIndex == 0 ? kMainColor : kWhite,
                          borderRadius: BorderRadius.circular(120),
                        ),
                        child: Text(
                          "Expense",
                          style: TextStyle(
                            color: _selectedSubMenuIndex == 0 ? kWhite : kBlack,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedSubMenuIndex = 1;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding * 3,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color:
                              _selectedSubMenuIndex == 1 ? kMainColor : kWhite,
                          borderRadius: BorderRadius.circular(120),
                        ),
                        child: Text(
                          "Income",
                          style: TextStyle(
                            color: _selectedSubMenuIndex == 1 ? kWhite : kBlack,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
