import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_am/screens/pages/list_page.dart';
import 'package:i_am/screens/pages/order_page.dart';
import 'package:i_am/screens/pages/profile_page.dart';
import 'package:i_am/utils/theme.dart';

class MainScreen extends StatefulWidget {
  final int index;
  const MainScreen({
    super.key,
    this.index = 0,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final NotchBottomBarController notchBottomBarController =
      NotchBottomBarController();

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    setState(() {
      _currentIndex = widget.index;
    });
    notchBottomBarController.index = _currentIndex;
    _pageController =
        PageController(initialPage: _currentIndex); // Set initial page
  }

  @override
  void dispose() {
    notchBottomBarController.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
        forceMaterialTransparency: true,
      ),
      extendBodyBehindAppBar: true,
      body: PageView(
        controller: _pageController,
        children: [
          OrderPage(),
          ListPage(),
          ProfilePage(),
        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
          notchBottomBarController.index = _currentIndex;
        },
      ),
      extendBody: true,
      bottomNavigationBar: AnimatedNotchBottomBar(
        onTap: (value) {
          _pageController.animateToPage(
            value,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOutCubic,
          );
          setState(() {
            _currentIndex = value;
          });
        },
        notchBottomBarController: notchBottomBarController,
        showBlurBottomBar: true,
        blurOpacity: 1,
        durationInMilliSeconds: 200,
        kIconSize: 22,
        kBottomRadius: 20,
        showLabel: false,
        bottomBarItems: [
          const BottomBarItem(
            inActiveItem: Icon(
              CupertinoIcons.location,
              color: CustomColors.darkColor,
            ),
            activeItem: Icon(
              CupertinoIcons.location_fill,
              color: CustomColors.primaryColor,
            ),
            itemLabel: 'Order',
          ),
          const BottomBarItem(
            inActiveItem: Icon(
              CupertinoIcons.square_list,
              color: CustomColors.darkColor,
            ),
            activeItem: Icon(
              CupertinoIcons.square_list_fill,
              color: CustomColors.primaryColor,
            ),
            itemLabel: 'History',
          ),
          const BottomBarItem(
            inActiveItem: Icon(
              CupertinoIcons.person,
              color: CustomColors.darkColor,
            ),
            activeItem: Icon(
              CupertinoIcons.person_fill,
              color: CustomColors.primaryColor,
            ),
            itemLabel: 'Profile',
          ),
        ],
      ),
    );
  }
}
