import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const Color kBackgroundColor = Color(0xFFF5CB58);
const Color kPrimaryColor = Color(0xFFE95422);
const Color navInActiveIcon = Color(0xFF9D9D9D);

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kPrimaryColor,
        
       
      
        selectedItemColor: kBackgroundColor,
        unselectedItemColor: navInActiveIcon,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items:  [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/home.svg"),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/foods.svg"),
            label: 'food',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/favourites.svg"),
            label: 'favourite',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/category.svg"),
            label: 'Profile',
          ),
           BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/feedback.svg"),
            label: 'feedback',
          ),
        ],
      ),
    );
  }
}