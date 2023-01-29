import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_card.dart';
import './dummydata.dart';
class CategoryScreen extends StatelessWidget {
  static const ROUTE_NAME = '/Categories';
  @override
  Widget build(BuildContext context) {
    return Scaffold(



      body: GridView(
          padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),

        children: DUMMY_CATEGORIES.map((e) => CategoryCard(e.id,e.title, e.color)).toList(),
      ),
    );
  }
}
