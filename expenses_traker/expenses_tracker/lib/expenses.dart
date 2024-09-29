import 'package:expenses_tracker/widget/chart/chart.dart';
import 'package:expenses_tracker/widget/expenses%20list/expenses_list.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widget/new_expenses.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() => _Expenses();
}

class _Expenses extends State<Expenses> {
  final List<Expense> _regesterExpenses = [
    Expense(
        title: "flutter cource",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: "education",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "travle",
        amount: 99.99,
        date: DateTime.now(),
        category: Category.travel),
  ];
  void _openAddExpenseveOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      
      constraints:const BoxConstraints(minWidth: double.infinity,),
      context: context,
      builder: (ctx) => NewExpense(addEx),
    );
  }

  void addEx(Expense ex) {
    setState(() {
      _regesterExpenses.add(ex);
    });
  }

  void removeEx(Expense ex) {
    var index=_regesterExpenses.indexOf(ex);
    setState(() {
      _regesterExpenses.remove(ex);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      content: const Text("expense deleting"),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(label: 'Undo',onPressed: () => setState(() {
        _regesterExpenses.insert(index,ex);
      }),),
    ));
  }

  @override
  Widget build(context) {
   final width=MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text("no expenses found ... start adding some !"),
    );
    if (_regesterExpenses.isNotEmpty) {
      mainContent = ExpenseList(removeEx, expenses: _regesterExpenses);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expenses Tracker"),
        actions: [
          IconButton(
              onPressed: _openAddExpenseveOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
        child: width<600? Column(
          children: [ Chart(expenses: _regesterExpenses), Expanded(child: mainContent)],
        ):Row(children: [ Expanded(child: Chart(expenses: _regesterExpenses)), Expanded(child: mainContent)],),
      ),
    );
  }
}
