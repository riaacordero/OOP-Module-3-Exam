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
              if (hasParentPost) ..._addParentPostData(currentPost),
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

_addParentPostData(Post? post) {
  return [
    Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(left: 60),
      child: Text.rich(
        TextSpan(
          children: [
            const WidgetSpan(
              child: Icon(Icons.reply_outlined, 
                size: 20, 
                color: Colors.black54
              )
            ),
            TextSpan(
              text: "   ${post!.user.name} replied", 
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black54
              )
            ),
          ]
        )

      ),
    ),
    PostItem(post: post.parentPost),
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