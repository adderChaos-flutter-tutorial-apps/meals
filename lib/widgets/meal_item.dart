import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onSelectMeal,
  });

  final Meal meal;
  final void Function() onSelectMeal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.hardEdge,
      elevation: 5,
      child: InkWell(
        onTap: onSelectMeal,
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl)),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                            icon: Icons.schedule,
                            label: '${meal.duration} min'),
                        const SizedBox(width: 12),
                        MealItemTrait(icon: Icons.work, label: complexityText),
                        const SizedBox(width: 12),
                        MealItemTrait(
                            icon: Icons.schedule, label: affordabilityText),
                      ],
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}