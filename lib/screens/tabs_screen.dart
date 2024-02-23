import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/data/models/meal_model.dart';
import 'package:food_app/providers/favorites_provider.dart';
import 'package:food_app/providers/navbar_provider.dart';
import 'package:food_app/screens/categories/categories_screen.dart';
import 'package:food_app/screens/filters/filters_Screen.dart';
import 'package:food_app/screens/meals/meals_screen.dart';

class TabsScreen extends ConsumerWidget {
  const TabsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Meal> favoriteMeals = ref.watch(favoriteMealsProvider);
    final availableMeals = ref.watch(filteredMealsProvider);
    final selectedPageIndex = ref.watch(navBarProvider);

    return Scaffold(
      appBar: AppBar(
        title: selectedPageIndex == 0
            ? const Text('Food Categories')
            : const Text('Favorites'),
      ),
      body: selectedPageIndex == 0
          ? CategoriesScreen(
        availableMeals: availableMeals,
      )
          : MealsScreen(
              meals: favoriteMeals,
            ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: ref.read(navBarProvider.notifier).selectPage,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.filter_alt),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) => const FiltersScreen()),
          );
        },
      ),
    );
  }
}
