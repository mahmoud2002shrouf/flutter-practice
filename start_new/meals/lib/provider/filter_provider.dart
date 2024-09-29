import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/meal_provider.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });
        void setFilters(Map<Filter,bool> filter){
          state=filter;
        }
  void setFilter(bool isAct, Filter filter) {
    state = {...state, filter: isAct};
  }
}

final filterProvider =
    StateNotifierProvider<FilterNotifier, Map<Filter, bool>>((ref) {
  return FilterNotifier();
});

final filterData=Provider((ref) {
  final meal=ref.watch(mealsProvider);
  final filterDaea=ref.watch(filterProvider);
  return meal.where((meal){
      if(filterDaea[Filter.glutenFree]! && !meal.isGlutenFree){
        return false;
      }
      if(filterDaea[Filter.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if(filterDaea[Filter.vegetarian]! && !meal.isVegetarian){
        return false;
      }
      if(filterDaea[Filter.vegan]! && !meal.isVegan){
        return false;
      }
      return true;
    }).toList();
} );