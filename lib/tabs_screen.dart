import 'package:flutter/material.dart';
import 'package:meals_app/CategoryScreen.dart';
import 'package:meals_app/favourotesScreen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
class TabsScreen extends StatefulWidget{
  static const ROUTE_NAME = '/Home';
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int selectedPage = 0;
  List<Map<String,dynamic>> pages= [
    {
      'page' : CategoryScreen(),
      'title' : 'Categories',

    },{
    'page': FavouriteScreen(),
      'title': 'Favourites'
    }
  ];
  List<Map<String,dynamic>> color_size_map= [
    {
      'color' : Colors.white,
      'size' : 10.0,

    },{
      'color': Colors.amberAccent,
      'size': 14.0
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title:  Text(pages[selectedPage]['title'])),
      backgroundColor: Theme.of(context).backgroundColor,
      body : pages[selectedPage]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        unselectedItemColor: color_size_map[selectedPage]['color'],

        selectedItemColor: color_size_map[1-selectedPage]['color'],
        selectedFontSize: color_size_map[1-selectedPage]['size'],
        unselectedFontSize: color_size_map[selectedPage]['size'],
        onTap: (int index){
          setState(() {
            selectedPage =index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.category),
          label: 'Categories',
            backgroundColor: Colors.red,


          ),
          BottomNavigationBarItem(icon: Icon(Icons.star),
              label: 'Favourites',
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}