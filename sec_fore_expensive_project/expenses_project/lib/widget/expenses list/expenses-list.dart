import "package:expenses_project/model/expens.dart";
import "package:expenses_project/widget/expenses%20list/expenses-item.dart";
import "package:flutter/material.dart";

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemove});
  final List<Expense> expenses;
  final void Function(Expense ex) onRemove;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(expenses[index]),
          background: Container(
            color: Colors.red,
            margin: const EdgeInsets.symmetric(horizontal: 20),
          ),
          onDismissed: (direction) {
            onRemove(expenses[index]);
          },
          child: ExpensesItem(
            expense: expenses[index],
          )),
    );
  }
}
