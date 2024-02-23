import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filters {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class FiltersNotifier extends StateNotifier<Map<Filters, bool>> {
  FiltersNotifier() : super({
    Filters.glutenFree: false,
    Filters.lactoseFree: false,
    Filters.vegan: false,
    Filters.vegetarian: false,
  });

  void setFilter(Filters filter, bool newVal) {
    state = {
      ...state, filter: newVal
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier,Map<Filters, bool>>((ref) {
  return FiltersNotifier();
});
