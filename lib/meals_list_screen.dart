import 'package:flutter/material.dart';

class MealsListScreen extends StatelessWidget{
static const ROUTE_NAME = 'meals-list';
  @override
  Widget build(BuildContext context) {
    final routeData = ModalRoute.of(context)?.settings.arguments as Map<String,dynamic>;
    final title = routeData['title'];
    final id = routeData['id'];
    final appBarColor = routeData['color'];
    return Scaffold(

        appBar: AppBar(
          title: Text(title),
backgroundColor: appBarColor,

        ),
        body: Center(child: Text('List of Recepies')));
  }

}