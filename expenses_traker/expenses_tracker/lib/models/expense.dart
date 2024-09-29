import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import "package:intl/intl.dart";

const uuid = Uuid();

enum Category { food, travel, leisure, work }

final formtDate = DateFormat.yMd();
const categoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formatDate {
    return formtDate.format(date);
  }
}

class ExpensesBucket {
  const ExpensesBucket(this.category, this.expenses);
  ExpensesBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses.where((ex) => ex.category == category).toList();
  final Category category;
  final List<Expense> expenses;

  double get TotalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
