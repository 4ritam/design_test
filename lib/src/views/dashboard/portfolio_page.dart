import 'package:design_test/config/themes.dart';
import 'package:design_test/src/views/portfolio/project_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
        ProjectPage(),
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
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          fontSize: 18,
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
              padding: const EdgeInsets.only(right: 20),
              child: SvgPicture.asset(
                'assets/svgs/cart_icon.svg',
                width: 20,
                height: 20,
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
              padding: const EdgeInsets.only(right: 20),
              child: SvgPicture.asset(
                'assets/svgs/notification_icon.svg',
                width: 20,
                height: 20,
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
      tabs: tabs
          .map(
            (tab) => Tab(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  tab,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
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
