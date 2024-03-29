import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../dummy-data/DUMMY_MEALS.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgument['categoryId'];
    final categoryTitle = routeArgument['categoryTitle'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => MealItem(
          id: categoryMeals[index].id,
          title: categoryMeals[index].title,
          imageUrl: categoryMeals[index].imageUrl,
          duration: categoryMeals[index].duration,
          complexity: categoryMeals[index].complexity,
          affordability: categoryMeals[index].affordability,
        ),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
