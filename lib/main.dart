import 'package:flutter/material.dart';
import './screens/tabs_screen.dart';

import '../screens/meal_detail_screen.dart';
import '../screens/category_meals_screen.dart';
import '../screens/category_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(236, 236, 236, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: TextStyle(
                  fontSize: 18,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      // home: CategoryScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },

      onGenerateRoute: (settings) {
        print(settings.arguments);

        //In case of dynamic calls to screen
//         if (settings.name == '/meal-settings') {
//           return ...
//           }else if (settings.name == '/meal-setup'){
// return ....
//           }else return ...
      },
      onUnknownRoute: (settings)  {
      return MaterialPageRoute(builder: (ctx)=>  CategoryScreen());
      },
    );
  }
}