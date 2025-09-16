import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:task/screens/dashboard/dashboard.dart';
import 'package:task/utils/app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  int _tabIndex = 2;
  int get tabIndex => _tabIndex;
  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: CircleNavBar(
          inactiveIcons: [
            Icon(Icons.menu_sharp, color: AppColors().mainColor),
            Icon(Icons.message, color: AppColors().mainColor),
            Icon(Icons.credit_card, color: AppColors().mainColor),
            Icon(Icons.notifications, color: AppColors().mainColor),
            Icon(Icons.person, color: AppColors().mainColor),
          ],
          activeIcons: [
            Icon(Icons.menu_sharp, color: AppColors().secondaryBgColor),
            Icon(Icons.message, color: AppColors().secondaryBgColor),
            Icon(Icons.credit_card, color: AppColors().secondaryBgColor),
            Icon(Icons.notifications, color: AppColors().secondaryBgColor),
            Icon(Icons.person, color: AppColors().secondaryBgColor),
          ],
          color: AppColors().secondaryBgColor,
          circleColor: AppColors().mainColor,
          height: 60,
          circleWidth: 60,
          activeIndex: tabIndex,
          onTap: (index) {
            tabIndex = index;
            pageController.jumpToPage(tabIndex);
          },
          cornerRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          elevation: 20,
        ),
      ),
      body: PageView(
        hitTestBehavior: HitTestBehavior.translucent,
        controller: pageController,
        onPageChanged: (v) {
          tabIndex = v;
        },
        children: [
          Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.pink),
          Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.blue),
          Dashboard(),
          Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.green),
          Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.green),
          Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.blue),
        ],
      ),
    );
  }
}
