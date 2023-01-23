import 'package:flutter/material.dart';

class IngredientCard extends StatelessWidget{
  final String ingredient;
  IngredientCard(this.ingredient);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1),
      padding:const  EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 2,color: Colors.black26)),
      ),

      child: Padding(
        padding: const EdgeInsets.fromLTRB(10,0,5,0),
        child: Text(ingredient,style: const TextStyle(fontSize: 13),),
      ),
    );
  }

}