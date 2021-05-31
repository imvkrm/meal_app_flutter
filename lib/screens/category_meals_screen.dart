import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = '/category-meals-screen';

  // final String catId;
  // final String catTitle;

  // CategoryMealsScreen(this.catId, this.catTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgus =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final catId = routeArgus['id'];
    final catTitle = routeArgus['title'];

    final categoryMeals =
        DUMMY_MEALS.where((meals) => meals.categories.contains(catId)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle!),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) => MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            ingredients: categoryMeals[index].ingredients,
            steps: categoryMeals[index].steps,
            duration: categoryMeals[index].duration,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
          ),
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
