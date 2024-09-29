import 'package:expensev_project/model/expesees-data.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({super.key, required this.expenses});
  final ExpensesDate expenses;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            expenses.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text("\$${expenses.amount.toStringAsFixed(2)}"),
              const Spacer(),
              Row(
                children: [
                  Icon(catagoryIcins[expenses.catagory]),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(expenses.getFormat)
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
