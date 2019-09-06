import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> filters;

  FiltersScreen(this.filters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isVegan = false;
  var _isVegetarian = false;
  var _isLactoseFree = false;

  @override
  void initState() {
    _isGlutenFree = widget.filters['isGlutenFree'];
    _isVegan = widget.filters['isVegan'];
    _isVegetarian = widget.filters['isVegetarian'];
    _isLactoseFree = widget.filters['isLactoseFree'];
    super.initState();
  }

  void saveFilter() {
    final selectedFilters = {
      'isGlutenFree': _isGlutenFree,
      'isVegan': _isVegan,
      'isVegetarian': _isVegetarian,
      'isLactoseFree': _isLactoseFree,
    };
    widget.saveFilters(selectedFilters);
  }

  Widget _buiildSwitchListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              tooltip: 'Saved',
              onPressed: saveFilter,
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buiildSwitchListTile(
                    'Gluten free',
                    'Only include Glutten',
                    _isGlutenFree,
                    (newValue) => setState(() => _isGlutenFree = newValue),
                  ),
                  _buiildSwitchListTile(
                    'Vegan free',
                    'Only include Vegan',
                    _isVegan,
                    (newValue) => setState(() => _isVegan = newValue),
                  ),
                  _buiildSwitchListTile(
                    'Vegetarian free',
                    'Only include Vegetarian',
                    _isVegetarian,
                    (newValue) => setState(() => _isVegetarian = newValue),
                  ),
                  _buiildSwitchListTile(
                    'LactoseFree free',
                    'Only include LactoseFree',
                    _isLactoseFree,
                    (newValue) => setState(() => _isLactoseFree = newValue),
                  ),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: saveFilter,
          mini: false,
          tooltip: 'saved',
          highlightElevation: 12,
        ),
      );
}
