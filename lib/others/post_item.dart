import 'package:chika/database/post.dart';
import 'package:flutter/material.dart';

class PostItem extends StatefulWidget {
  final Post? post;

  const PostItem({Key? key, required this.post}) : super(key: key);

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return widget.post == null 
      ? const SizedBox(height: 0)
      : Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 12,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: CircleAvatar(
                      backgroundImage: widget.post!.user.profilePicture.image
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(widget.post!.user.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                                ),
                              ),
                              Text(" · " + widget.post!.timeDisplay,
                                style: const TextStyle(
                                  color: Colors.black38,
                                  fontSize: 16
                                ),
                              )
                            ],
                          ),
                          
                          const SizedBox(height: 5),
                          Text(widget.post!.message, 
                            style: const TextStyle(
                              fontSize: 16
                            )
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  
                                }, 
                                label: Text(getPostChildren(widget.post)
                                  .length
                                  .toString()
                                ),
                                icon: const Icon(
                                  Icons.chat_bubble_outline_outlined
                                ), 
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0),
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent
                                  ),
                                  foregroundColor: MaterialStateProperty.all(
                                    Colors.black38
                                  )
                                )
                              )                            
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
    );     
  }
}