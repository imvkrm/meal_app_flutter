import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty? Center(child: Text('No Faviorite yet'),):ListView.builder(
          itemBuilder: (ctx, index) => MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            ingredients: favoriteMeals[index].ingredients,
            steps: favoriteMeals[index].steps,
            duration: favoriteMeals[index].duration,
            affordability: favoriteMeals[index].affordability,
            complexity: favoriteMeals[index].complexity
          //pass the instance of _removeMeal
          ),
          itemCount: favoriteMeals.length,
        );
  }
}
