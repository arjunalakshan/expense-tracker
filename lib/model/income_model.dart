import 'package:expense_tracker/utils/colors.dart';
import 'package:flutter/material.dart';

//* Income Category enum
enum IncomeCategory {
  freelance,
  salary,
  passive,
  sales,
}

//* Map to store the Income Category and its corresponding Icon
Map<IncomeCategory, Icon> incomeCategoryToIcon = {
  IncomeCategory.freelance: const Icon(Icons.laptop_mac_rounded),
  IncomeCategory.salary: const Icon(Icons.money_rounded),
  IncomeCategory.passive: const Icon(Icons.arrow_circle_down_rounded),
  IncomeCategory.sales: const Icon(Icons.sell_rounded),
};

//* Map to store the Income Category and its corresponding Color
Map<IncomeCategory, Color> incomeCategoryToColor = {
  IncomeCategory.freelance: kOrange,
  IncomeCategory.salary: kGreen,
  IncomeCategory.passive: kBlack,
  IncomeCategory.sales: kYellow,
};

class IncomeModel {
  final int id;
  final String title;
  final IncomeCategory category;
  final double amount;
  final DateTime date;
  final DateTime time;
  final String note;

  IncomeModel({
    required this.id,
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
    required this.time,
    required this.note,
  });

  //* Convert the IncomeModel to a json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category.index,
      'amount': amount,
      'date': date.toIso8601String(),
      'time': time.toIso8601String(),
      'note': note,
    };
  }

  //* Create an IncomeModel from a json
  factory IncomeModel.fromJson(Map<String, dynamic> json) {
    return IncomeModel(
      id: json['id'],
      title: json['title'],
      category: IncomeCategory.values[json['category']],
      amount: json['amount'],
      date: DateTime.parse(json['date']),
      time: DateTime.parse(json['time']),
      note: json['note'],
    );
  }
}
