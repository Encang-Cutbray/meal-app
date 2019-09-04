import 'package:flutter/material.dart';

import '../routes/RouteApps.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildListTile(
      String title,
      IconData icon,
      String routeName,
    ) =>
        ListTile(
          leading: Icon(
            icon,
            size: 20,
          ),
          title: Text(
            title,
            style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          onTap: () => Navigator.of(context).pushReplacementNamed(routeName),
        );

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant, RouteApps.Home),
          buildListTile('Filters', Icons.settings, RouteApps.Filters),
        ],
      ),
    );
  }
}
