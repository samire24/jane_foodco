import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jane_foodco/pages/home/main_food_page.dart';
import 'package:jane_foodco/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  // late PersistentTabController _controller;

  List pages= [
    MainFoodPage(),
    Container(child: Center(child: Text("Next page"),),),
    Container(child: Center(child: Text("Next next page"),),),
    Container(child: Center(child: Text("Next next next page"),),),
  ];
  void onTapNav(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  //
  // @override
  // void initState() {
  //   super.initState();
  //
  //   _controller = PersistentTabController(initialIndex:0);
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        currentIndex: _selectedIndex,
        onTap: onTapNav ,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined,),
              label:"Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive,),
              label:"history",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart,),
              label:"cart",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,),
              label:"me",
          ),
        ],
      ),
    );
  }
}
