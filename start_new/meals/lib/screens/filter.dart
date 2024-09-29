import 'package:flutter/material.dart';
import 'package:meals/screens/drawer.dart';
import 'package:meals/screens/tabs.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/filter_provider.dart';
class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key,});

  

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final data=ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter"),
      ),
      drawer: DrawerScreen(onSelect: (iden) {
        Navigator.of(context).pop();
        if (iden == "Meals") {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => const Tabs()));
        }
      }),
      body:  Column(children: [
          SwitchListTile(
            value: data[Filter.glutenFree]!,
            onChanged: (isChe) => ref.read(filterProvider.notifier).setFilter(isChe, Filter.glutenFree),
            title: Text(
              "Gluten Free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Only include gluten free meals.",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
          SwitchListTile(
            value: data[Filter.vegan]!,
            onChanged: (isChe) => ref.read(filterProvider.notifier).setFilter(isChe, Filter.vegan),
            title: Text(
              "Vegn ",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Only include Vegn meals.",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
          SwitchListTile(
            value: data[Filter.vegetarian]!,
            onChanged: (isChe) => ref.read(filterProvider.notifier).setFilter(isChe, Filter.vegetarian),
            title: Text(
              "Vegetarian",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Only include Vegetarian meals.",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
          SwitchListTile(
            value: data[Filter.lactoseFree]!,
            onChanged: (isChe) =>ref.read(filterProvider.notifier).setFilter(isChe, Filter.lactoseFree),
            title: Text(
              "Lactose Free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Only include Lactose Free meals.",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          )
        ]),
    );
  }
}
