import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoptreo_v1/Screens/layout/home.dart';
import 'package:shoptreo_v1/components/colors/app_colors.dart';

class Routing extends StatefulWidget {
  const Routing({super.key});

  @override
  State<Routing> createState() => _RoutingState();
}

class _RoutingState extends State<Routing> {
  int _selectedIndex = 0;

  final List<Widget> _screen = [
    const HomeScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _screen.elementAt(_selectedIndex),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(13),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
            elevation: 0,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            unselectedItemColor: AppColors.greyTxt,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(
              color: AppColors.primaryOrange,
              fontFamily: "Filson.Pro",
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: TextStyle(
              color: AppColors.greyTxt,
              fontFamily: "Filson.Pro",
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
            items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/Home.svg"),
              activeIcon: SvgPicture.asset("assets/Home.svg"),
            label: "Home"
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/discover.svg"),
              activeIcon: SvgPicture.asset("assets/discover.svg"),
              label: "Discover"
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/albums-outline.svg"),
              activeIcon: SvgPicture.asset("assets/albums-outline.svg"),
              label: "Orders"
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/Profile.svg"),
              activeIcon: SvgPicture.asset("assets/Profile.svg"),
              label: "Account"
          ),
        ]),
      ),
    );
  }
}

