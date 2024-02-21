import 'package:brewbite/components/bottom_nav_bar.dart';
import 'package:brewbite/const.dart';
//import 'package:brewbite/pages/cart_page.dart';
//import 'package:brewbite/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'shop_page.dart';
import 'cart_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //navigate bottom bar
  int _selectedIndex=0;
  void navigateBottomBar(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  //pages
  final List<Widget> pages=[
    //shop page
    ShopPage(),
    //cart page
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar:MyBottomNavBar(
        onTabChange: (index)=>navigateBottomBar(index),
      ) ,
      body: pages[_selectedIndex],//_pages
    );
  }
}
