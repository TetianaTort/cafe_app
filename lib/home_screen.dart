import 'package:cafe_app/screens/account_screen.dart';
import 'package:cafe_app/screens/product_list.dart';
import 'package:cafe_app/utils/widgets/custom_cart_icon.dart';
import 'package:flutter/material.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({super.key});

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int _selectedTab = 0;
  // int _productsInCart = 0;
  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  final List _pages = const [
    HomeScreen(),
    ProductList(),
    AccauntScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          CustomCart(),
        ],
      ),
      body: SafeArea(
        child: _pages[_selectedTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: const Color.fromARGB(255, 48, 28, 27),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.short_text_rounded), label: 'Products'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String testImage = 'lib/global/assets/pepper.jpg';
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text('Cafe Bla'),
          expandedHeight: 200.0,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              testImage,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                10,
                (index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset(testImage),
                      ),
                      Text('Category $index')
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
