import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:soil_app/screens/main/home/home_screen.dart';
import 'package:soil_app/screens/main/news/newsScreen.dart';
import 'package:soil_app/screens/main/profile/profile_screen.dart';
import 'package:soil_app/screens/main/status/status_screen.dart';
import 'package:soil_app/utils/app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //-------store the active index

  // //----trigger when bottom nav item is clicked
  // void onItemTapped(int val) {
  //   setState(() {
  //     activeIndex = val;
  //   });
  // }

  //-------screen list
  final List<Widget> _screens = [
    const HomeScreen(),
    const NewsScreen(),
    const LineMain(),
    const Profile(),
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: _screens[activeIndex],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 0.5,
                color: Colors.black54,
                offset: Offset(0.0, 0.75),
              )
            ],
            color: AppColors.white,
          ),
          height: 75,
          child: GNav(
            gap: 8,
            rippleColor: const Color.fromARGB(255, 150, 150, 150),
            iconSize: 26,
            curve: Curves.easeInCubic,
            haptic: true,
            tabBorderRadius: 30,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            duration: const Duration(milliseconds: 400),
            textStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: AppColors.white),
            color: const Color.fromARGB(255, 169, 169, 169),
            activeColor: AppColors.white,
            tabBackgroundColor: const Color.fromARGB(255, 48, 44, 62),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.newspaper,
                text: 'News',
              ),
              GButton(
                icon: Icons.stacked_bar_chart_sharp,
                text: 'Status',
              ),
              GButton(
                icon: Icons.account_circle,
                text: 'Profile',
              ),
            ],
            selectedIndex: activeIndex,
            onTabChange: (index) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
        ));
  }
}
