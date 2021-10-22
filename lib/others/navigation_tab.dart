import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/new_post_screen.dart';
import '../screens/news_feed_screen.dart';
import '../screens/notification_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/search_screen.dart';

class NavigationTab extends StatefulWidget {
  @override
  _NavigationTabState createState() => _NavigationTabState();
}

class _NavigationTabState extends State<NavigationTab> {
  int _selected = 0;

  final List _screens = const [
    NewsFeedScreen(),
    SearchScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens.elementAt(_selected),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF0056D7),
          child: Image.asset('assets/img/crack-a-post-icon.png',
              width: 40, height: 40, alignment: Alignment.center),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CreatePostScreen()));
          },
        ),
        bottomNavigationBar: CupertinoTabBar(
          onTap: (index) {
            setState(() {
              _selected = index;
            });
          },
          activeColor: const Color(0xFF0056D7),
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
