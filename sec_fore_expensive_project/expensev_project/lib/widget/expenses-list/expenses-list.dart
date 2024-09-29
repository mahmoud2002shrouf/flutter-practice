import 'package:expensev_project/model/expesees-data.dart';
import 'package:expensev_project/widget/expenses-list/expenses-item.dart';
import "package:flutter/material.dart";

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.removeExpenses});
  final List<ExpensesDate> expenses;
  final void Function(ExpensesDate ex) removeExpenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
              background: Card(
                color: Theme.of(context).colorScheme.error,
                child: Container(
                  color: Theme.of(context).colorScheme.error,
                  margin: EdgeInsets.symmetric(
                      horizontal:
                          Theme.of(context).cardTheme.margin!.horizontal),
                ),
              ),
              key: ValueKey(expenses[index]),
              onDismissed: (direction) {
                removeExpenses(expenses[index]);
              },
              child: ExpensesItem(expenses: expenses[index]),
            ));
  }
}
