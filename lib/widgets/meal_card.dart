import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meals_app/meal_detail_screen.dart';
import 'package:meals_app/models/meal.dart';

class MealCard extends StatelessWidget {
  final String id;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final String url;
  final Color appBarColor;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  MealCard(
      {required this.id,
        required this.complexity,
        required this.affordability,
        required this.duration,
        required this.title,
        required this.url,
        required this.appBarColor,
        required this.isGlutenFree,
        required this.isLactoseFree,
        required this.isVegan,
        required this.isVegetarian,});
  // Widget get extraDetails{
  //   if(!isGlutenFree && !isVegetarian && !isVegan && !isLactoseFree) return Container();
  //   else {
  //    return Column(
  //      children: [
  //        SizedBox(
  //          height: 20,
  //        ),
  //        Row(
  //          mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           children: <Widget>[
  //             (isGlutenFree) ? Text('Gluten Free'): SizedBox(height: 0,width: 0,),
  //             (isVegetarian) ? Text('Vegeterian') : SizedBox(height: 0,width: 0,),
  //             (isVegan) ? Text('Vegan') : SizedBox(height: 0,width: 0,),
  //             (isLactoseFree) ? Text('Lactose Free') : SizedBox(height: 0,width: 0,)
  //
  //           ],
  //         ),
  //      ],
  //    );
  //
  //
  //   }
  // }
  String get complexityText {
    switch (complexity) {
      case Complexity.Challenging:
        return 'Medium';
      case Complexity.Hard:
        return 'Hard';
      case Complexity.Simple:
        return 'Easy';
    }
  }

  String get time {
    int hours = 0;
    int minutes = 0;
    hours = (duration / 60).floor();
    minutes = duration % 60;
    if (minutes != 0) {
      if (hours == 0) {
        return '$minutes minutes';
      } else if (hours == 1) {
        return '$hours hour $minutes minutes';
      }

      return '$hours hours $minutes minutes';
    } else {
      if (hours == 1) {
        return '$hours hour';
      }

      return '$hours hours';
    }
  }

  Widget get moneyIcon {
    switch (affordability) {
      case Affordability.Affordable:
        return const Icon(Icons.monetization_on);
      case Affordability.Pricey:
        return Row(
          children: const <Widget>[
            Icon(Icons.monetization_on),
            Icon(Icons.monetization_on)
          ],
        );
      case Affordability.Luxurious:
        return Row(
          children: const <Widget>[
            Icon(Icons.monetization_on),
            Icon(Icons.monetization_on),
            Icon(Icons.monetization_on),
          ],
        );
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.ROUTE_NAME,
        arguments: {'id': id, 'appBarColor': appBarColor});
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectMeal(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Image.network(url),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.grey.withOpacity(0.4),
                      //alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          const Icon(Icons.schedule),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            time,
                            style: const TextStyle(fontSize: 13),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          const Icon(Icons.work),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            complexityText,
                            style: TextStyle(fontSize: 13),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[moneyIcon],
                      ),
                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
