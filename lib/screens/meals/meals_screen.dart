import 'package:flutter/material.dart';
import 'package:food_app/screens/meals/mgrid_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({Key? key, this.title, required this.meals})
      : super(key: key);

  final String? title;
  final List meals;

  @override
  Widget build(BuildContext context) {
    return title == null
        ? body()
        : Scaffold(
            appBar: AppBar(
              title: Text(title!),
            ),
            body: body(),
          );
  }

  SingleChildScrollView body() {
    return SingleChildScrollView(
      child: Column(
        children: meals.map((e) => MealGridItem(meal: e)).toList(),
      ),
    );
  }
}
