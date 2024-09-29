import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});
  final Expense expense;
  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
          
          children: [
          Text(
            expense.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 4),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('\$${expense.amount.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.titleMedium),
            Row(
              children: [
                Icon(categoryIcon[expense.category]),
                const SizedBox(
                  width: 10,
                ),
                Text(expense.formatDate,
                    style: Theme.of(context).textTheme.titleMedium)
              ],
            )
          ])
        ]),
      ),
    );
  }
}
