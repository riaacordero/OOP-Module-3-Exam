import 'package:flutter/material.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({ Key? key }) : super(key: key);

  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Feed")
      )
      
    );
  }
}