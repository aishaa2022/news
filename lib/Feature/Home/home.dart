import 'package:flutter/material.dart';
import 'package:news/Core/colors.dart';
import 'package:news/Feature/News/news.dart';
import 'package:news/Feature/Notify/notification.dart';
import 'package:news/Feature/Profile/profile.dart';
import 'package:news/Feature/Search/search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentState = 0;
  List<Widget> screens = [
    const News_page(),
    const Search(),
    const Notify(),
    const Profile_page()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentState],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentState,
          onTap: (value) {
            setState(() {
              currentState = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: AppColors.lamonada,
          unselectedItemColor: AppColors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "notification"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile")
          ]),
    );
  }
}
