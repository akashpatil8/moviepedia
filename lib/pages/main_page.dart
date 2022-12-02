import 'package:flutter/material.dart';
import 'package:movieapp/constants/constants.dart';
import 'package:movieapp/pages/favourite_page.dart';
import 'package:movieapp/pages/home_page.dart';
import 'package:movieapp/pages/profile_page.dart';
import 'package:movieapp/pages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> tabs = [
    const HomePage(),
    const SearchPage(),
    const FavouritesPage(),
    const ProfilePage(),
  ];

  List<BottomNavigationBarItem> kBottomNavigationBarItems = const [
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(MyIcons.home),
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(MyIcons.search),
      ),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(MyIcons.favourite),
      ),
      label: 'Watchlist',
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(MyIcons.profile),
      ),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        onTap: onItemTapped,
        currentIndex: selectedIndex,
        selectedItemColor: MyColors.kAccentColor,
        items: kBottomNavigationBarItems,
      ),
    );
  }
}
