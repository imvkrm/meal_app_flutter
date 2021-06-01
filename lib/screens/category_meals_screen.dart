import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String routeName = '/category-meals-screen';

  final List<Meal> _avalableMeals;
  CategoryMealsScreen(this._avalableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String catTitle;
  late List<Meal> displayMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  // void _removeMeal(String mealId) {
  //   setState(() {
  //     print(mealId);
  //     displayMeals.removeWhere((element) => element.id == mealId);
  //   });
  // }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgus =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;

      final catId = routeArgus['id'];
      catTitle = routeArgus['title'] as String;
      displayMeals = widget._avalableMeals
          .where((meals) => meals.categories.contains(catId))
          .toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) => MealItem(
            id: displayMeals[index].id,
            title: displayMeals[index].title,
            imageUrl: displayMeals[index].imageUrl,
            ingredients: displayMeals[index].ingredients,
            steps: displayMeals[index].steps,
            duration: displayMeals[index].duration,
            affordability: displayMeals[index].affordability,
            complexity: displayMeals[index].complexity,
          //  removeMeal: _removeMeal, //pass the instance of _removeMeal
          ),
          itemCount: displayMeals.length,
        ),
      ),
    );
  }
}
