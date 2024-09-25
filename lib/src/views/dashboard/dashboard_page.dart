import 'package:design_test/src/views/dashboard/portfolio_page.dart';
import 'package:design_test/src/views/dashboard/widgets/nav_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 1;

  static const pages = [
    Scaffold(
      backgroundColor: Colors.white,
    ),
    PortfolioPage(),
    Scaffold(
      backgroundColor: Colors.white,
    ),
    Scaffold(
      backgroundColor: Colors.white,
    ),
  ];

  static const List<Map<String, String>> navBarItems = [
    {
      'label': 'Home',
      'svg': 'assets/svgs/home_icon.svg',
    },
    {
      'label': 'Portfolio',
      'svg': 'assets/svgs/portfolio_icon.svg',
    },
    {
      'label': 'Input',
      'svg': 'assets/svgs/input_icon.svg',
    },
    {
      'label': 'Profile',
      'svg': 'assets/svgs/profile_icon.svg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Scaffold(
                body: pages[_selectedIndex],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              height: 60.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6.r,
                    offset: Offset(0, -3.h),
                  ),
                ],
              ),
              child: bottomNavBar(),
            ),
          ],
        ),
      ),
    );
  }

  Row bottomNavBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        navBarItems.length,
        (index) => NavButton(
          label: navBarItems[index]['label']!,
          svg: navBarItems[index]['svg']!,
          isActive: index == _selectedIndex,
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
