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
            backgroundColor: kMainColor,
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

  //* Delete income from shared preferences
  Future<void> deleteIncome(int index, BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      //* Get the list of incomes from shared preferences
      List<String>? incomeListString = sharedPreferences.getStringList(typeKey);

      //* Convert available income to List<ExpenseModel>
      List<IncomeModel> incomeModelList = [];
      if (incomeListString != null) {
        incomeModelList = incomeListString
            .map((e) => IncomeModel.fromJson(json.decode(e)))
            .toList();
      }

      //* Remove the income from the list
      incomeModelList.removeWhere((element) => element.id == index);

      //* Convert List<ExpenseModel> to List<String>
      List<String> incomeStringList =
          incomeModelList.map((e) => json.encode(e.toJson())).toList();

      //* Save the list in shared preference
      await sharedPreferences.setStringList(
        typeKey,
        incomeStringList,
      );

      //* Show success message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Income deleted successfully"),
            backgroundColor: kMainColor,
          ),
        );
      }
    } catch (error) {
      //* Show error message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Failed to delete income"),
            backgroundColor: kRed,
          ),
        );
      }
    }
  }
}
