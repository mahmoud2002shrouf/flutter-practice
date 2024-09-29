import 'package:expenses_tracker/main.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widget/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(this.removeEx,{super.key, required this.expenses});
  final void Function(Expense) removeEx;
  final List<Expense> expenses;
  @override
  Widget build(context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(background: Card(color:KcolorScheme.error,margin: CardTheme.of(context).margin,),onDismissed:(diirection)=>removeEx(expenses[index]),key: ValueKey(expenses[index]),child: ExpenseItem(expenses[index])));
  }
}
