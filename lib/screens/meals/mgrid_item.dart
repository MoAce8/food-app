import 'package:flutter/material.dart';
import 'package:food_app/data/models/meal_model.dart';
import 'package:food_app/screens/meal_details/meal_details_screen.dart';
import 'package:transparent_image/transparent_image.dart';

class MealGridItem extends StatelessWidget {
  const MealGridItem({Key? key, required this.meal}) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => MealDetails(
                meal: meal,
              ),
            ),
          );
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.schedule),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              '${meal.duration} min',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.work),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              meal.complexity.name,
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.attach_money),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              meal.affordability.name,
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
