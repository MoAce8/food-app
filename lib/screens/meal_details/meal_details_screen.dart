import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/data/models/meal_model.dart';
import 'package:food_app/providers/favorites_provider.dart';

class MealDetails extends ConsumerWidget {
  const MealDetails({Key? key, required this.meal}) : super(key: key);

  final Meal meal;

  @override
  Widget build(
    BuildContext context,
      WidgetRef ref
  ) {
    bool wasAdded = false;
    final List<Meal> favoriteMeals = ref.watch(favoriteMealsProvider);
    bool isFav = favoriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              wasAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleFavorite(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: wasAdded
                      ? const Text('Added to favourites')
                      : const Text('Removed from favourites'),
                ),
              );
            },
            icon: Icon(isFav?Icons.star:Icons.star_border,
            color: isFav?Colors.amber:Colors.white),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              height: 12,
            ),
            for (final item in meal.ingredients)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: Text(
                  item,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
            const SizedBox(
              height: 26,
            ),
            Text(
              'Steps',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              height: 12,
            ),
            for (final item in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                child: Text(
                  item,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
