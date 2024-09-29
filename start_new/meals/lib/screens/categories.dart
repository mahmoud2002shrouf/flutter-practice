import "package:flutter/material.dart";
import "package:meals/data/dummy_data.dart";
import "package:meals/models/category.dart";
import "package:meals/models/meal.dart";
import "package:meals/screens/meals.dart";
import "package:meals/widget/category_grid_item.dart";

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.meals});
  final List<Meal> meals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _sesctedCategory(BuildContext context, Category category) {
    final List<Meal> meal = widget.meals
        .where((element) => element.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => Meals(
              title: category.title,
              meals: meal,
            )));
  }

  @override
  Widget build(context) {
    return AnimatedBuilder(
        animation: _animationController,
        child: GridView(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            for (final categor in availableCategories)
              CategoryGridItem(
                  category: categor,
                  onSelectCategory: () {
                    _sesctedCategory(context, categor);
                  }),
          ],
        ),
        builder: (ctx, child) => Opacity(
            opacity:_animationController.value ,
            child: child));
  }
}


//  (ctx, child) => SlideTransition(
//             position:
//                 Tween(begin: const Offset(0, 0.3), end: const Offset(0, 0))
//                     .animate(CurvedAnimation(
//                         parent: _animationController,
//                         curve: Curves.easeInOut)),
//             child: child));