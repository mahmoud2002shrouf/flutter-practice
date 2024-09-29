import 'package:expensev_project/widget/chart/chart.dart';
import 'package:expensev_project/widget/expenses-list/expenses-list.dart';
import 'package:expensev_project/model/expesees-data.dart';
import 'package:expensev_project/widget/new-expenses.dart';
import "package:flutter/material.dart";

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  final List<ExpensesDate> _regestersExpenses = [
    ExpensesDate(
        amount: 19.2,
        title: "flutter Corse",
        date: DateTime.now(),
        catagory: Catagory.work),
    ExpensesDate(
        amount: 18.2,
        title: "food",
        date: DateTime.now(),
        catagory: Catagory.food),
  ];

  void addExpenses(ExpensesDate ex) {
    setState(() {
      _regestersExpenses.add(ex);
    });
  }

  void removeExpenses(ExpensesDate ex) {
    final indexOf = _regestersExpenses.indexOf(ex);
    setState(() {
      _regestersExpenses.remove(ex);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text("Expenses Deleted"),
      action: SnackBarAction(
        label: "Undo",
        onPressed: () {
          setState(() {
            _regestersExpenses.insert(indexOf, ex);
          });
        },
      ),
    ));
  }

  void _openAddExpesesOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpenses(addExpenses));
  }

  @override
  Widget build(context) {
    Widget mainContent = const Center(
      child: Text("No Expenses Found ."),
    );
    if (_regestersExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _regestersExpenses,
        removeExpenses: removeExpenses,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("add new expenses "),
        actions: [
          IconButton(
              onPressed: _openAddExpesesOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(children: [
        Chart(expenses: _regestersExpenses),
        Expanded(child: mainContent)
      ]),
    );
  }
}
