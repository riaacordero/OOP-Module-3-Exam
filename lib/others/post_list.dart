import 'package:chika/database/post.dart';
import 'package:chika/others/post_item.dart';
import 'package:flutter/material.dart';

class PostList extends StatefulWidget {
  final bool inPostScreen;
  final Post? mainPost;

  const PostList({
    Key? key, 
    required this.inPostScreen, 
    this.mainPost
  }) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    List<Post> postList = widget.inPostScreen
      ? getPostChildren(widget.mainPost)
      : posts.reversed.toList();

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          Post currentPost = postList[index];
          bool hasParentPost = currentPost.parentPost != null;
          return Column(
            children: [
              if (!widget.inPostScreen && hasParentPost) ..._addParentPostData(currentPost),
              PostItem(post: currentPost),
              const Divider()
            ],
          );     
        },
        childCount: postList.length
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
      height: 25,
      child: const VerticalDivider(thickness: 3)
    ),
    const SizedBox(height: 20)
  ];
}