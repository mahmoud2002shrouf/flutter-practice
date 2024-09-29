import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:uuid/uuid.dart";

const uuid = Uuid();

enum Catagory {
  food,
  lisure,
  work,
  travle,
}

const catagoryIcins = {
  Catagory.food: Icons.food_bank,
  Catagory.lisure: Icons.movie,
  Catagory.travle: Icons.travel_explore,
  Catagory.work: Icons.work,
};

final fooramt = DateFormat.yMd();

class ExpensesDate {
  ExpensesDate(
      {required this.amount,
      required this.title,
      required this.date,
      required this.catagory})
      : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Catagory catagory;
  String get getFormat {
    return fooramt.format(date);
  }
}

class ExpensesBucket {
  const ExpensesBucket({required this.catagory, required this.expenses});
  ExpensesBucket.forCategory(List<ExpensesDate> allExpenses, this.catagory)
      : expenses = allExpenses.where((ex) => ex.catagory == catagory).toList();
  final Catagory catagory;
  final List<ExpensesDate> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expens in expenses) {
      sum += expens.amount;
    }
    return sum;
  }
}
