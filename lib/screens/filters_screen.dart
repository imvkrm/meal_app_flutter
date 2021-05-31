import 'package:flutter/material.dart';
import 'package:meal_app_flutter/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const String routeName = '/filters-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: Drawer(child: MainDrawer(),),
    );
  }
}
