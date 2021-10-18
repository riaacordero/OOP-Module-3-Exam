import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/new_post_screen.dart';
import '../screens/news_feed.dart';
import '../screens/notification_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/search_screen.dart';

class NavigationTab extends StatefulWidget {
  @override
  _NavigationTabState createState() => _NavigationTabState();
}

class _NavigationTabState extends State<NavigationTab> {
  int _selected = 0;

  final List _screens = [
    const NewsFeed(),
    const SearchScreen(),
    const NotificationScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens.elementAt(_selected),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFE39600),
          child: const Icon(Icons.add, color: Colors.white),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CreatePostScreen()));
          },
        ),
        bottomNavigationBar: CupertinoTabBar(
          onTap: (index) {
            setState(() {
              _selected = index;
            });
          },
          activeColor: Color(0xFF0056D7),
          currentIndex: _selected,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home)),
            BottomNavigationBarItem(icon: Icon(Icons.search)),
            BottomNavigationBarItem(icon: Icon(Icons.notifications)),
            BottomNavigationBarItem(icon: Icon(Icons.person))
          ],
        ));
  }
}
