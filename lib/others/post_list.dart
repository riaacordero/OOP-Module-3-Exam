import 'package:chika/database/user.dart';
import 'package:chika/database/post.dart';
import 'package:chika/others/post_item.dart';
import 'package:flutter/material.dart';

class PostList extends StatelessWidget {
  final User? mainUser;
  const PostList({Key? key, this.mainUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          Post currentPost = posts.reversed.toList()[index];
          bool hasParentPost = currentPost.parentPost != null;
          return Column(
            children: [
              if (hasParentPost) PostItem(post: currentPost.parentPost),
              if (hasParentPost) ..._addConnection(currentPost.parentPost),
              PostItem(post: currentPost),
              const Divider()
            ],
          );     
        },
        childCount: posts.length
      )
    );
  }
}

_addConnection(Post? post) {
  return [
    const SizedBox(height: 5),
    Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 30),
      height: 50,
      child: const VerticalDivider(thickness: 3)
    ),
    const SizedBox(height: 20)
  ];
}