import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/CategoryScreen.dart';
import 'package:meals_app/meals_list_screen.dart';
import 'package:meals_app/widgets/category_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.red,

//       canvasColor: ,
        fontFamily: 'Lato',
      ),
      home: CategoryScreen(),
      routes: {
        MealsListScreen.ROUTE_NAME : (ctx)=> MealsListScreen()
      },
    );
  }
}



