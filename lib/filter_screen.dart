import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const ROUTE_NAME = '/FilterScreen';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool glutenFree = false;
  bool lastoseFree = false;
  bool vegan = false;
  bool vegetarian = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        drawer: MainDrawer(),
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text(
                'Adjust your prefrences',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
        SwitchListTile(
          value: glutenFree,
          onChanged: (newVal){
            setState(() {
          glutenFree = newVal;
            });
          },
          title: const Text('Gluten-Free'),
          subtitle: const Text('Only include gluten free meals'),
        ),
           SwitchListTile(
          value: lastoseFree,
          onChanged: (newVal){
        setState(() {
          lastoseFree = newVal;
        });
          },
          title: const Text( 'Lactose-Free'),
          subtitle: const Text('Only include lactose free meals'),
        ),
           SwitchListTile(
          value: vegan,
          onChanged: (newVal){
              setState(() {
                vegan = newVal;
              });
          },
          title: const Text('Vegan'),
          subtitle: const Text('Only include vegan meals'),
        ),
           SwitchListTile(
          value: vegetarian,
          onChanged: (newVal){
              setState(() {
                vegetarian = newVal;

              });
          },
          title: const Text('Vegan'),
          subtitle: const Text('Only include vegan meals'),
        ),


          ],
        ));
  }
}
