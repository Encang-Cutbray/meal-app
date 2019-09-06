import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> avaiableMeals;
  CategoryMealsScreen(this.avaiableMeals);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  var _loaded = false;
  String categoryTitle;
  List<Meal> displayMeals;

  void _removeMeal(String mealId) {
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loaded) {
      final routeArgument =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routeArgument['categoryId'];
      categoryTitle = routeArgument['categoryTitle'];
      displayMeals = widget.avaiableMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      _loaded = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => MealItem(
          id: displayMeals[index].id,
          title: displayMeals[index].title,
          imageUrl: displayMeals[index].imageUrl,
          duration: displayMeals[index].duration,
          complexity: displayMeals[index].complexity,
          affordability: displayMeals[index].affordability,
          removeItem: _removeMeal,
        ),
        itemCount: displayMeals.length,
      ),
    );
  }
}
