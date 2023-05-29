import 'package:flutter/material.dart';
import 'package:news_app/view/botom_nav_bar/Business.dart';
import 'package:news_app/view/botom_nav_bar/health.dart';
import 'package:news_app/view/botom_nav_bar/sports.dart';

import 'botom_nav_bar/Technology.dart';
import 'botom_nav_bar/science.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  List<Widget> screens =
  [
    Sports(),
    Science(),
    Health(),
    Business(),
    technology(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromARGB(255, 38, 77, 172),
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
              label: "Sports",
              icon: Icon(Icons.sports_volleyball), backgroundColor: Colors.black),
          BottomNavigationBarItem(
              label: "Science",
              icon: Icon(Icons.science), backgroundColor: Colors.black),
          BottomNavigationBarItem(
              label: "health",
              icon: Icon(Icons.health_and_safety),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              label: "Business",
              icon: Icon(Icons.business), backgroundColor: Colors.black),
          BottomNavigationBarItem(
              label: "Technology",
              icon: Icon(Icons.android_sharp), backgroundColor: Colors.black),
        ],
        onTap: (val) {
          setState(() {
            currentIndex = val;
          });
        },
      )
      ,
    );
  }
}