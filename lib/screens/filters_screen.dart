import 'package:flutter/material.dart';
import 'package:meal_app_flutter/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = '/filters-screen';

  final Function saveFilters;
  final Map<String, bool> _currentFilters;
  FiltersScreen(this._currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegan = false;
  var _isVegetarian = false;

  @override
  void initState() {
    _isGlutenFree = widget._currentFilters['gluten']!;
    _isLactoseFree = widget._currentFilters['lactose']!;
    _isVegan = widget._currentFilters['vegan']!;
    _isVegetarian = widget._currentFilters['vegetarian']!;
    super.initState();
  }

  Widget _builderSwitchListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: (val) => updateValue(val),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
              onPressed: () {
                var selectedFilters = {
                  'gluten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegan': _isVegan,
                  'vegetarian': _isVegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _builderSwitchListTile('Gluten-free',
                    'Only include glutein free meals', _isGlutenFree, (value) {
                  setState(() {
                    _isGlutenFree = value;
                  });
                }),
                _builderSwitchListTile('Lactose-free',
                    'Only include lactose free meals', _isLactoseFree, (value) {
                  setState(() {
                    _isLactoseFree = value;
                  });
                }),
                _builderSwitchListTile(
                    'Vegan', 'Only include vegan meals', _isVegan, (value) {
                  setState(() {
                    _isVegan = value;
                  });
                }),
                _builderSwitchListTile('Vegetarian',
                    'Only include vegetarian meals', _isVegetarian, (value) {
                  setState(() {
                    _isVegetarian = value;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
