import "package:expenses_project/model/expens.dart";
import "package:flutter/material.dart";

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({super.key, required this.expense});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(expense.title),
          Row(
            children: [
              Text("\$${expense.amount.toString()}"),
              const Spacer(),
              Row(
                children: [
                  Icon(categoryIcon[expense.category]),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(expense.formateDate)
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}
