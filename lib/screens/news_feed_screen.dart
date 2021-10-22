import 'package:chika/others/post_list.dart';
import 'package:chika/screens/new_post_screen.dart';
import 'package:flutter/material.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  _NewsFeedScreenState createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: Color(0xFF0056D7),
            automaticallyImplyLeading: false,
            title: Center(
                child: Text("Home",
                    style: TextStyle(fontWeight: FontWeight.bold))),
          ),
          SliverPadding(padding: EdgeInsets.symmetric(vertical: 4)),
          PostList(inPostScreen: false),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF0056D7),
          child: Image.asset('assets/img/crack-a-post_icon.png',
              width: 40, height: 40, alignment: Alignment.center),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CreatePostScreen()));
          }),
    );
  }
}
