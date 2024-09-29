import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
class FavoritMealNotifier extends StateNotifier<List<Meal>>{
   FavoritMealNotifier():super([]);



   bool toggleMealFav(Meal meal){
    final isFav=state.contains(meal);
    if(isFav){
      state=state.where((m) => m.id!=meal.id).toList();
      return false;
    }else{
      state=[...state,meal];
      return true;
    }
   }

}

final favoritProvider=StateNotifierProvider<FavoritMealNotifier,List<Meal>>((ref){
  return FavoritMealNotifier();
});