import "package:expenses_project/model/expens.dart";
import "package:expenses_project/new-expenses.dart";
import "package:expenses_project/widget/expenses%20list/expenses-list.dart";
import "package:flutter/material.dart";

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  final List<Expense> _regesterWxpenses = [
    Expense(
        title: "work",
        amount: 22,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "food",
        amount: 20,
        date: DateTime.now(),
        category: Category.food)
  ];
  void addExpenses(Expense ex) {
    setState(() {
      _regesterWxpenses.add(ex);
      Navigator.pop(context);
    });
  }

  void _openAddNewExpenses() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => NewExpenses(addExpensesss: addExpenses),
    );
  }

  void removeExpenses(Expense ex) {
    final indexOfExpense = _regesterWxpenses.indexOf(ex);

    setState(() {
      _regesterWxpenses.remove(ex);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Expenses Delete"),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _regesterWxpenses.insert(indexOfExpense, ex);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("no expenses"),
    );
    if (_regesterWxpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _regesterWxpenses,
        onRemove: removeExpenses,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Expenses"),
        actions: [
          IconButton(
              onPressed: _openAddNewExpenses, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [Expanded(child: mainContent)],
      ),
    );
  }
}
