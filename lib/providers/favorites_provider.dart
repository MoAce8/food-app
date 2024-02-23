import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/data/models/meal_model.dart';
import 'package:food_app/providers/filters_provider.dart';

import 'meals_provider.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleFavorite(Meal meal) {
    if (state.contains(meal)) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);
  return meals.where((meal) {
    if (activeFilters[Filters.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filters.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filters.vegan]! && !meal.isVegan) {
      return false;
    }
    if (activeFilters[Filters.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
