import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widget/mail_item.dart';

class Meals extends StatelessWidget {
  const Meals({super.key, this.title, required this.meals});
  final String? title;
  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MailItem(meal: meals[index],));
    if (meals.isEmpty) {
      content = Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            "Uh oh ... nothing here !",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(height: 16),
          Text(
            "Try seleting a deffrent category !",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ]),
      );
    }
    if (title == null) {
      return content;
    } else {
      return Scaffold(appBar: AppBar(title: Text(title!)), body: content);
    }
  }
}
