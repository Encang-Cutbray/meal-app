import 'package:flutter/material.dart';

import './models/meal.dart';
import './dummy-data/DUMMY_MEALS.dart';
import './routes/RouteApps.dart';

import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/filters_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'isGlutenFree': false,
    'isVegan': false,
    'isVegetarian': false,
    'isLactoseFree': false,
  };

  List<Meal> _favoriteMeals = [];

  List<Meal> _avaiableMeals = DUMMY_MEALS;

  void _toggleFavorite(String index) {
    final exisitingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == index);

    if (exisitingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(exisitingIndex);
      });
    } else {
      _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == index));
    }
  }

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _avaiableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['isGlutenFree'] && !meal.isGlutenFree) {
          return false;
        }

        if (_filters['isVegan'] && !meal.isVegan) {
          return false;
        }

        if (_filters['isVegetarian'] && !meal.isVegetarian) {
          return false;
        }

        if (_filters['isLactoseFree'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  bool _isMealFavorite(String mealId) {
    bool result = _avaiableMeals.any((meal) => meal.id == mealId);
    print(result);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(225, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                  fontSize: 15,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
      ),

      // home: CategoriesScreen(),
      initialRoute: RouteApps.Home,
      routes: {
        RouteApps.Home: (ctx) => TabsScreen(_favoriteMeals),
        RouteApps.CategoryMeals: (ctx) => CategoryMealsScreen(_avaiableMeals),
        RouteApps.Filters: (ctx) => FiltersScreen(_filters, _setFilters),
        RouteApps.MealDetails: (ctx) => MealDetailScreen(
              _toggleFavorite,
              _isMealFavorite,
            ),
      },
      onUnknownRoute: (setting) => MaterialPageRoute(
        builder: (ctx) => CategoriesScreen(),
      ),
    );
  }
}
