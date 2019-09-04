import 'package:flutter/material.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './routes/RouteApps.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
                fontWeight: FontWeight.bold)),
      ),

      // home: CategoriesScreen(),
      initialRoute: RouteApps.Home,
      routes: {
        RouteApps.Home: (ctx) => TabsScreen(),
        RouteApps.CategoryMeals: (ctx) => CategoryMealsScreen(),
        RouteApps.MealDetails: (ctx) => MealDetailScreen(),
      },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
