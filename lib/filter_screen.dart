import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const ROUTE_NAME = '/FilterScreen';
  final Function setFilter;
  final Map<String,bool> filterValues;
  FilterScreen(this.filterValues,this.setFilter);
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool glutenFree = false;
  bool lastoseFree = false;
  bool vegan = false;
  bool vegetarian = false;
    @override
  void initState() {
    // TODO: implement initState
      glutenFree = widget.filterValues['gluten-free'] as bool;
      lastoseFree = widget.filterValues['lactose-free'] as bool;

vegan = widget.filterValues['vegan'] as bool;

vegetarian = widget.filterValues['vegetarian'] as bool;

      super.initState();
    }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        drawer: MainDrawer(),
        appBar: AppBar(
          title: const Text("Filters"),
          actions: <Widget>[
             IconButton(onPressed: (){
               widget.setFilter({
                 'gluten-free' : glutenFree,
                 'lactose-free' : lastoseFree,
                 'vegan' : vegan,
                 'vegetarian' : vegetarian
               });
             }, icon: Icon(Icons.check))
          ],
          centerTitle: true,
        ),
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
          title: const Text('Vegetarian'),
          subtitle: const Text('Only include vegetarian meals'),
        ),


          ],
        ));
  }
}
