import 'package:chika/database/user.dart';
import 'package:chika/database/post.dart';
import 'package:flutter/material.dart';

class PostList extends StatelessWidget {
  final User? mainUser;
  const PostList({Key? key, this.mainUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          Post currentPost = posts[index];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: CircleAvatar(
                        backgroundImage: currentPost.user.profilePicture.image
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(currentPost.user.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(currentPost.message, 
                              style: const TextStyle(
                                fontSize: 16
                              )
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Divider()
            ],
          );          
        },
        childCount: posts.length
      )
    );
  }
}