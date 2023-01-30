import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/CategoryScreen.dart';
import 'package:meals_app/dummydata.dart';
import 'package:meals_app/meals_list_screen.dart';
import 'package:meals_app/tabs_screen.dart';
import 'package:meals_app/widgets/category_card.dart';
import 'package:meals_app/meal_detail_screen.dart';

import 'filter_screen.dart';
import 'models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   Map<String,bool> filters = {
        'gluten-free' : false,
      'lactose-free' : false,
    'vegan' : false,
    'vegetarian' : false
  };
  List<Meal> mealList = DUMMY_MEALS;
  void updateFilter(Map<String,bool> filterData){
    setState(() {
      filters = filterData;
        mealList = DUMMY_MEALS.where((meal) {
            if(filters['gluten-free']! && !meal.isGlutenFree){
              return false;
            }
            if(filters['lactose-free']! && !meal.isLactoseFree){
              return false;
            }
            if(filters['vegan']! && !meal.isVegan){
              return false;
            }
            if(filters['vegetarian']! && !meal.isVegetarian){
              return false;
            }
            return true;
        }).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        backgroundColor: const Color.fromRGBO(250, 240, 222, 1),
        appBarTheme:const  AppBarTheme(color: Colors.red),

        fontFamily: 'Lato',
      ),
      home: TabsScreen(),
      routes: {
        TabsScreen.ROUTE_NAME : (ctx)=>TabsScreen(),
        MealsListScreen.ROUTE_NAME : (ctx)=> MealsListScreen(mealList),
        MealDetailScreen.ROUTE_NAME : (ctx)=>MealDetailScreen(),
        FilterScreen.ROUTE_NAME : (ctx)=>FilterScreen(filters,updateFilter),
      },
      onGenerateRoute: (settings){
          return MaterialPageRoute(builder: (ctx)=>CategoryScreen()); //if route is not given in routes map in main.dart
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx)=>CategoryScreen()); // last resort if onGenerateRoute is not given
      },
    );
  }
}



