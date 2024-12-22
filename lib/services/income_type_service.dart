import 'dart:convert';
import 'package:expense_tracker/model/income_model.dart';
import 'package:expense_tracker/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncomeTypeService {
  static const String typeKey = "income";

  //* Save income in shared preference
  Future<void> saveIncome(IncomeModel income, BuildContext context) async {
    try {
      //* Get the shared preferences instance
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      //* Get the income list from shared preferences
      List<String>? incomeList = sharedPreferences.getStringList(typeKey);

      //* Create a List of IncomeModel
      List<IncomeModel> incomeModelList = [];

      //* Check if the income list is not null and then map the list to IncomeModel
      if (incomeList != null) {
        incomeModelList =
            incomeList.map((e) => IncomeModel.fromJson(jsonDecode(e))).toList();
      }

      //* Add the new income to the list
      incomeModelList.add(income);

      //* Convert the List<IncomeModel> to List<String>
      List<String> incomeStringList =
          incomeModelList.map((e) => json.encode(e.toJson())).toList();

      //* Save the list in shared preferences
      await sharedPreferences.setStringList(typeKey, incomeStringList);

      //* Show a success message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Income added successfully"),
            backgroundColor: kBlack,
          ),
        );
      }
    } on Exception {
      //* Show a failure message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Failed to add income"),
            backgroundColor: kRed,
          ),
        );
      }
    }
  }

  //* Get the list of income from shared preferences
  Future<List<IncomeModel>> getIncomeList() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    List<String>? incomeStringList = sharedPreferences.getStringList(typeKey);

    List<IncomeModel> incomeModelList = [];
    if (incomeStringList != null) {
      incomeModelList = incomeStringList
          .map((e) => IncomeModel.fromJson(json.decode(e)))
          .toList();
    }
    return incomeModelList;
  }
}
