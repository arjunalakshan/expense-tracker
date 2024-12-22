import 'package:flutter/material.dart';

//* Enum for Expense Category
enum ExpenseCategory {
  shopping,
  subscription,
  food,
  health,
  transport,
}

//* Map to store the Expense Category and its corresponding Icon
Map<ExpenseCategory, Icon> expenseCategoryToIcon = {
  ExpenseCategory.shopping: const Icon(Icons.shopping_cart_rounded),
  ExpenseCategory.subscription: const Icon(Icons.subscriptions_rounded),
  ExpenseCategory.food: const Icon(Icons.fastfood_rounded),
  ExpenseCategory.health: const Icon(Icons.local_hospital_rounded),
  ExpenseCategory.transport: const Icon(Icons.directions_bus_rounded),
};

//* Map to store the Expense Category and its corresponding Color
Map<ExpenseCategory, Color> expenseCategoryToColor = {
  ExpenseCategory.shopping: Colors.red,
  ExpenseCategory.subscription: Colors.blue,
  ExpenseCategory.food: Colors.green,
  ExpenseCategory.health: Colors.purple,
  ExpenseCategory.transport: Colors.orange,
};

class ExpenseModel {
  final int id;
  final String title;
  final ExpenseCategory category;
  final double amount;
  final DateTime date;
  final DateTime time;
  final String note;

  ExpenseModel({
    required this.id,
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
    required this.time,
    required this.note,
  });

  //* Convert the ExpenseModel to a json
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

  //* Convert the json to an ExpenseModel
  factory ExpenseModel.fromJson(Map<String, dynamic> json) {
    return ExpenseModel(
      id: json['id'],
      title: json['title'],
      category: ExpenseCategory.values[json['category']],
      amount: json['amount'],
      date: DateTime.parse(json['date']),
      time: DateTime.parse(json['time']),
      note: json['note'],
    );
  }
}
