import 'package:flutter/material.dart';
import 'package:meals_app/CategoryScreen.dart';

import '../filter_screen.dart';

class MainDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(250, 240, 222, 1),
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
              width: double.infinity,
            padding:const  EdgeInsets.all(10),
            alignment: Alignment.bottomLeft,
        child: const Text("Meals App!",style:TextStyle(fontSize: 30,fontWeight: FontWeight.w900,color: Colors.black,) ,),
         // decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration:const  BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
            child:  ListTile(
              leading:const  Icon(Icons.restaurant,semanticLabel: 'Meals'),
              title:const Text("Meals",style: TextStyle(fontSize: 20,fontWeight:FontWeight.w600),),
              onTap: (){
                Navigator.of(context).pushReplacementNamed('/');
              },

            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
            child:  ListTile(
              leading: const Icon(Icons.filter_alt,semanticLabel: 'Filters'),
              title: const Text("Filters",style: TextStyle(fontSize: 20,fontWeight:FontWeight.w600),),
              onTap: (){
                  Navigator.of(context).pushReplacementNamed(FilterScreen.ROUTE_NAME);
              },
            ),

          ),

        ],
      ),
    );
  }

}