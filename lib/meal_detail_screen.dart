import 'package:flutter/material.dart';
import 'package:meals_app/dummydata.dart';
import 'package:meals_app/tabs_screen.dart';
import 'package:meals_app/widgets/ingredientCard.dart';

import 'CategoryScreen.dart';

class MealDetailScreen extends StatelessWidget {
  static const ROUTE_NAME = '/MealDetails';
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final appBarColor = args['appBarColor'];
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == args['id']);
    return Scaffold(

      backgroundColor: Color.fromRGBO(245, 230, 222, 1),
      appBar: AppBar(
        title: Text(
          selectedMeal.title,
          style: const TextStyle(fontSize: 17),

        ),
        backgroundColor: appBarColor,
        actions: <Widget>[
            IconButton(onPressed: (){
              Navigator.of(context).popAndPushNamed(TabsScreen.ROUTE_NAME);
            }, icon: const Icon(Icons.home,semanticLabel: 'Home Screen',))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  height: 300,
                  width: double.infinity,
                  padding: EdgeInsets.zero,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        selectedMeal.imageUrl,
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ),
            const Center(
              child: Text(
                'Ingredients',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(

              decoration: BoxDecoration(
          color: Colors.white38,
                border: Border.all(width: 1,color: Colors.black38),


              ),
              height: 250,
              width: 320,
              child: ListView.builder(itemBuilder: (ctx,index){
                return IngredientCard(selectedMeal.ingredients[index]);
              },itemCount: selectedMeal.ingredients.length,),
            ),

            const Center(
              child: Text(
                'Steps',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(

              decoration: BoxDecoration(
                color: Colors.white38,
                border: Border.all(width: 1,color: Colors.black38),


              ),
              height: 250,
              width: 320,
              child: ListView.builder(itemBuilder: (ctx,index){
                return IngredientCard("${index+1}.  ${selectedMeal.steps[index]}");
              },itemCount: selectedMeal.steps.length,),
            ),


          ],
        ),
      ),
    );
  }
}
