import 'package:bookapp/pages/Search.dart';
import 'package:bookapp/pages/Settings.dart';
import 'package:bookapp/pages/details.dart';
import 'package:bookapp/pages/home_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required List<NavigationDestination> destinations})
      : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  final screens = [
    HomeScreen(),
    Detailspage(),
    Searchpage(),
    Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: screens[index],
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
                backgroundColor: Colors.white10,
                indicatorColor: Colors.blue.shade100,
                labelTextStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
            child: NavigationBar(
                height: 50,
                selectedIndex: index,
                onDestinationSelected: (index) {
                  setState(() {
                    this.index = index;
                  });
                },
                destinations: [
                  NavigationDestination(
                    icon: Icon(Icons.home),
                    selectedIcon: Icon(Icons.home_filled),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.book),
                    selectedIcon: Icon(Icons.book),
                    label: 'Reading',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.search),
                    selectedIcon: Icon(Icons.search),
                    label: 'Search',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.settings),
                    selectedIcon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
