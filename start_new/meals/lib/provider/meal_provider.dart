import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
//we can read only
final mealsProvider=Provider((ref) {
  return dummyMeals;
});
