import 'package:flutter/material.dart';
import 'package:pmsn20252/utils/game_app.dart';
import 'package:pmsn20252/utils/value_listener.dart';
import 'package:super_animated_navigation_bar/super_animated_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    GameApp(),
    Center(child: Text('Favorites Page')), 
    Center(child: Text('Cart Page')),     
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 186, 155, 111),
        actions: [
          ValueListenableBuilder(
            valueListenable: ValueListener.isDark, 
            builder: (context, value, child){
              return value
              ? IconButton(icon: Icon(Icons.sunny), onPressed: (){
                ValueListener.isDark.value = false;
              },)
              : IconButton(icon: Icon(Icons.nightlight), onPressed: (){
                ValueListener.isDark.value = true;
              },);
            }
          )
          
        ],
      ),
      drawer: Drawer(),
      body: _pages[_currentIndex],
      bottomNavigationBar: SuperAnimatedNavBar(
          currentIndex: _currentIndex,
          indeicatorDecoration: IndeicatorDecoration(
            indicatorType: IndicatorType.lamp,
            indicatorPosition: IndicatorPosition.top,
          ),
          items: [
            NavigationBarItem(
              selectedIcon: Icon(Icons.home_filled,
                  size: 28, color: Color.fromARGB(255, 87, 66, 37)),
              unSelectedIcon: Icon(Icons.home_outlined,
                  size: 28, color: Color.fromARGB(255, 87, 66, 37)),
            ),
            NavigationBarItem(
              selectedIcon:
                  Icon(Icons.star, size: 28, color: Color.fromARGB(255, 87, 66, 37)),
              unSelectedIcon: Icon(Icons.star_border,
                  size: 28, color: Color.fromARGB(255, 87, 66, 37)),
            ),
            NavigationBarItem(
              selectedIcon: Icon(Icons.shopping_cart,
                  size: 28, color: Color.fromARGB(255, 87, 66, 37)),
              unSelectedIcon: Icon(Icons.shopping_cart_outlined,
                  size: 28, color: Color.fromARGB(255, 87, 66, 37)),
            ),
          ],
          onTap: (index) => setState(() => _currentIndex = index),
          barHeight: 70,
          backgroundColor: Color.fromARGB(255, 186, 155, 111),
        ),
    );
  }
}
