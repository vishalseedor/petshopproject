
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pet_shop/Helpers/Colors/colors.dart';
import 'package:pet_shop/screens/AdoptionCartScreen/pages/adoptioncartscreen.dart';
import 'package:pet_shop/screens/PetFavouriteScreen/pages/petfavoutitescreen.dart';
import 'package:pet_shop/screens/PetViewScreen/pages/petviewscreen.dart';
import 'package:pet_shop/screens/ProfileScreen/pages/profilescreen.dart';


class PetBottomNavigation extends StatefulWidget {
  const PetBottomNavigation({super.key});

  @override
  State<PetBottomNavigation> createState() => _PetBottomNavigationState();
}

class _PetBottomNavigationState extends State<PetBottomNavigation> {
    int _selectedIndex = 0;
  static  final List<Widget> _widgetOptions = <Widget>[
   const PetViewScreen(),
   const PetFavouritePage(),
   const AdoptionScreen(),
   const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor:purpleColor, 
              color: Colors.black,
              tabs:const [
              
                GButton(
                  icon: LineIcons.home,
                
                  text: 'Home',
                  
                ),
                GButton(
                  icon: LineIcons.heart,
                  text: 'Likes',
                ),
                GButton(
                  icon: LineIcons.dog,
                  text: 'Adoption',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}