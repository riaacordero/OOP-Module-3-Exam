import 'package:chika/database/post.dart';
import 'package:chika/others/main_post_item.dart';
import 'package:chika/others/navigation_tab.dart';
import 'package:chika/others/post_list.dart';
import 'package:flutter/material.dart';
import 'new_post_screen.dart';

class PostScreen extends StatefulWidget {
  final Post? post;

  const PostScreen({Key? key, this.post}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.post == null
      ? const SizedBox(height: 0)
      : Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: BackButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NavigationTab()));
                },
              ),
              floating: true,
              snap: true,
              backgroundColor: const Color(0xFF0056D7),
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: const Text("Post", 
                style: TextStyle(fontWeight: FontWeight.bold)
              ),
            ),
            SliverToBoxAdapter(child: MainPostItem(post: widget.post)),
            PostList(inPostScreen: true, mainPost: widget.post)
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFE39600),
          child: const Icon(Icons.add, color: Colors.white),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) 
                  => CreatePostScreen(mainPost: widget.post)));
          },
        )
    );
  }
}