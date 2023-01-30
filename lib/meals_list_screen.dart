import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_card.dart';
import './dummydata.dart';

class MealsListScreen extends StatefulWidget {
  static const ROUTE_NAME = '/meals-list';
  final List<Meal> filteredMeals;
  MealsListScreen(this.filteredMeals);
  @override
  State<MealsListScreen> createState() => _MealsListScreenState();
}

class _MealsListScreenState extends State<MealsListScreen> {
  @override
  Widget build(BuildContext context) {
    final routeData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final title = routeData['title'];
    final id = routeData['id'];
    final appBarColor = routeData['color'];
    final filteredList = widget.filteredMeals
        .where((element) => element.categories.contains(id))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: appBarColor,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealCard(
            appBarColor: appBarColor,
            id: filteredList[index].id,
            url: filteredList[index].imageUrl,
            title: filteredList[index].title,
            affordability: filteredList[index].affordability,
            complexity: filteredList[index].complexity,
            duration: filteredList[index].duration,
            isGlutenFree: filteredList[index].isGlutenFree,
            isVegan : filteredList[index].isVegan,
            isVegetarian: filteredList[index].isVegetarian,
            isLactoseFree: filteredList[index].isLactoseFree,

          );
        },
        itemCount: filteredList.length,
      ),
    );
  }
}
