import 'package:flutter/material.dart';
import 'package:food_app/data/dummy_data.dart';
import 'package:food_app/data/models/meal_model.dart';
import 'package:food_app/screens/categories/cgrid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key, required this.availableMeals}) : super(key: key);
  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(6),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 20,
        ),
        children: [
          for(final category in availableCategories)
            CategoryGridItem(category: category,availableMeals: availableMeals),
        ],
    );
  }
}
