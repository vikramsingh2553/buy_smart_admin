import 'package:buy_smart_admin/Category/ui/category_screen.dart';
import 'package:buy_smart_admin/Product/ui/account_screen.dart';
import 'package:buy_smart_admin/Product/ui/product_screen.dart';
import 'package:buy_smart_admin/shared/string_const.dart';
import 'package:flutter/material.dart';

class StartingHomeScreen extends StatefulWidget {
  const StartingHomeScreen({super.key});

  @override
  State<StartingHomeScreen> createState() => _StartingHomeScreenState();
}

class _StartingHomeScreenState extends State<StartingHomeScreen> {
  final List<Widget> screens = [
    const ProductScreen(),
    const CategoryScreen(),
    const AccountScreen(),
  ];
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentTab,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (int index) {
          setState(() {
            currentTab = index;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: StringConst.homeLabel,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: StringConst.categoryLabel,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: StringConst.accountLabel,
          ),
        ],
      ),
    );
  }
}
