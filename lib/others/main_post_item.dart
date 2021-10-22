import 'package:chika/database/post.dart';
import 'package:flutter/material.dart';

class MainPostItem extends StatefulWidget {
  final Post? post;

  const MainPostItem({Key? key, required this.post}) : super(key: key);

  @override
  State<MainPostItem> createState() => _MainPostItemState();
}

class _MainPostItemState extends State<MainPostItem> {
  @override
  Widget build(BuildContext context) {
    return widget.post == null 
      ? const SizedBox(height: 0)
      : Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircleAvatar(
                    backgroundImage: widget.post!.user.profilePicture.image
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.post!.user.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                    Text(widget.post!.actualTime,
                      style: const TextStyle(
                        color: Colors.black38,
                        fontSize: 16
                      ),
                    )                
                  ],
                )          
              ],
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(widget.post!.message, 
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 24
                )
              ),
            ),
            const SizedBox(height: 10),
            const Divider(color: Colors.black54),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.chat_bubble_outline, color: Colors.black54),
                const SizedBox(width: 5),
                Text(getPostChildren(widget.post).length.toString(), 
                  style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                  ))
              ],
            ),
            const SizedBox(height: 5),
            const Divider(color: Colors.black54),
          ],
        ),
      );
  }
}