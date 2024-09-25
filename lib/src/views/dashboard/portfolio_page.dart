import 'package:design_test/config/themes.dart';
import 'package:design_test/src/views/portfolio/project_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static const tabs = ["Project", "Saved", "Shared", "Achievement"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: tabs.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: tabBarView(),
    );
  }

  TabBarView tabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        const ProjectPage(),
        Container(),
        Container(),
        Container(),
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        'Portfolio',
        style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          fontSize: 18.sp,
          color: Colors.black,
        ),
      ),
      centerTitle: false,
      actions: [
        Tooltip(
          message: 'Cart',
          child: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: SvgPicture.asset(
                'assets/svgs/cart_icon.svg',
                width: 20.w,
                height: 20.h,
                color: primaryColor,
              ),
            ),
          ),
        ),
        Tooltip(
          message: 'Notifications',
          child: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: SvgPicture.asset(
                'assets/svgs/notification_icon.svg',
                width: 20.w,
                height: 20.h,
                color: primaryColor,
              ),
            ),
          ),
        )
      ],
      bottom: tabBar(),
    );
  }

  TabBar tabBar() {
    return TabBar(
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      indicatorColor: primaryColor,
      indicatorSize: TabBarIndicatorSize.tab,
      controller: _tabController,
      onTap: (value) => setState(() {}),
      tabs: tabs
          .map(
            (tab) => Tab(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 8.w,
                ),
                child: Text(
                  tab,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14.sp,
                    fontWeight: _tabController.index == tabs.indexOf(tab)
                        ? FontWeight.w500
                        : FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
