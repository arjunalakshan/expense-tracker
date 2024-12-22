import 'dart:convert';

import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpenseTypeService {
  static const String typeKey = "expense";

  //* List of expense
  List<ExpenseModel> expenseList = [];

  //* Save expense in shared preference
  Future<void> saveExpense(ExpenseModel expense, BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      List<String>? expenseListString =
          sharedPreferences.getStringList(typeKey);

      //* Convert available expenses to List<ExpenseModel>
      List<ExpenseModel> expenseModelList = [];

      //* Check if there is any expense in shared preference
      if (expenseListString != null) {
        expenseModelList = expenseListString
            .map(
              (e) => ExpenseModel.fromJson(
                json.decode(e),
              ),
            )
            .toList();
      }
      //* Add new expense to the list
      expenseModelList.add(expense);

      //* Convert List<ExpenseModel> to List<String>
      List<String> expenseStringList = expenseModelList
          .map(
            (e) => json.encode(
              e.toJson(),
            ),
          )
          .toList();

      //* Save the list in shared preference
      await sharedPreferences.setStringList(
        typeKey,
        expenseStringList,
      );

      //* Show success message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Expense added successfully"),
            backgroundColor: kBlack,
          ),
        );
      }
    } on Exception catch (error) {
      //* Show error message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Failed to add expense"),
            backgroundColor: kRed,
          ),
        );
      }
    }
  }

  //* Get all expenses from shared preference
  Future<List<ExpenseModel>> getExpense() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String>? expenseListString = sharedPreferences.getStringList(typeKey);

    //* Convert available expenses to List<ExpenseModel>
    List<ExpenseModel> expenseModelList = [];
    if (expenseListString != null) {
      expenseModelList = expenseListString
          .map(
            (e) => ExpenseModel.fromJson(
              json.decode(e),
            ),
          )
          .toList();
    }
    //* Return the list
    return expenseModelList;
  }
}
