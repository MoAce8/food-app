import 'package:flutter/material.dart';
import 'package:food_app/data/category_model.dart';
import 'package:food_app/data/models/meal_model.dart';
import 'package:food_app/screens/meals/meals_screen.dart';


class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({Key? key, required this.category, required this.availableMeals}) : super(key: key);
  final Category category;
  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => MealsScreen(
              title: category.title,
              meals: availableMeals
                  .where((meal) => meal.categories.contains(category.id))
                  .toList(),
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.54),
                category.color.withOpacity(0.9),
              ],
            )),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
