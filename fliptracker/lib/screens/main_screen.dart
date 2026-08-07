import 'package:flutter/material.dart';

import '../pages/best_properties_page.dart';
import '../pages/export_page.dart';
import '../pages/property_overview_page.dart';
import '../widgets/app_footer.dart';
import '../widgets/app_navbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController();

  int _selectedIndex = 0;

  void _navigate(int index) {
    setState(() {
      _selectedIndex = index;
    });

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppNavbar(
            selectedIndex: _selectedIndex,
            onNavigate: _navigate,
          ),

          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: const [
                PropertyOverviewPage(),
                BestPropertiesPage(),
                ExportPage(),
              ],
            ),
          ),

          const AppFooter(),
        ],
      ),
    );
  }
}