import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/meals_list_screen.dart';

class CategoryCard extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  void openCategory(BuildContext context) {
    Navigator.of(context).pushNamed(MealsListScreen.ROUTE_NAME,arguments: {
      'id' : id,
      'title' : title,
      'color' : color
    });
  }

  CategoryCard(this.id,this.title, this.color);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(7),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.6), color],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight),
            borderRadius: BorderRadius.circular(7)),
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
