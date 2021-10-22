import 'package:chika/others/post_list.dart';
import 'package:flutter/material.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({ Key? key }) : super(key: key);

  @override
  _NewsFeedScreenState createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: Color(0xFF0056D7),
            automaticallyImplyLeading: false,
            title: Center(
              child: Text("Home", 
                style: TextStyle(fontWeight: FontWeight.bold)
              )
            ),
          ),
          SliverPadding(padding: EdgeInsets.symmetric(vertical: 4)),
          PostList(inPostScreen: false)
        ],
      )
    );
  }
}