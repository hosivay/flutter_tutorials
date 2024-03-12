import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hosivay',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profile',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) {
                return const CupertinoPageScaffold(
                  child: Material(
                    child: Center(
                      child: Text('Home'),
                    ),
                  ),
                );
              },
            );
          case 1:
            return CupertinoTabView(
              builder: (context) {
                return const CupertinoPageScaffold(
                  child: Material(
                    child: Center(
                      child: Text('Search'),
                    ),
                  ),
                );
              },
            );
          case 2:
            return CupertinoTabView(
              builder: (context) {
                return const CupertinoPageScaffold(
                  child: Material(
                    child: Center(
                      child: Text('Profile'),
                    ),
                  ),
                );
              },
            );
          default:
            return CupertinoTabView(
              builder: (context) {
                return const CupertinoPageScaffold(
                  child: Material(
                    child: Center(
                      child: Text('Home'),
                    ),
                  ),
                );
              },
            );
        }
      },
    );
  }
}
