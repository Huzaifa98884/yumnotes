import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:yumnotes/constants/constants.dart';
import 'package:yumnotes/views/Favourites.dart';
import 'package:yumnotes/views/Home.dart';
import 'package:yumnotes/views/MyRestaurants.dart';
import 'package:yumnotes/views/Profile.dart';

class BottomNavigationHolder extends StatefulWidget {
  const BottomNavigationHolder({super.key});

  @override
  State<BottomNavigationHolder> createState() => _BottomNavigationHolderState();
}

class _BottomNavigationHolderState extends State<BottomNavigationHolder> {
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const List<Widget> pages = <Widget>[
      HomeScreen(),
      MyRestaurantsScreen(),
      FavouritesScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      body: Center(
        child: pages.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: kAppbarText,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              size: 25,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.restaurant_menu,
              size: 25,
            ),
            label: 'My Restaurants',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_rounded,
              size: 25,
            ),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 25,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        unselectedItemColor: Color(0xff9DA8C3),
        selectedItemColor: kButtonBac,
        selectedIconTheme: IconThemeData(color: kButtonBac),
        onTap: onItemTapped,
      ),
    );
  }
}
