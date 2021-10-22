import 'package:chika/database/post.dart';
import 'package:chika/database/user.dart';
import 'package:chika/others/navigation_tab.dart';
import 'package:chika/screens/post_screen.dart';
import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  final Post? mainPost;

  const CreatePostScreen({Key? key, this.mainPost}) : super(key: key);

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  String _postMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        backgroundColor: const Color(0xFF0056D7),
        centerTitle: true,
        elevation: 0,
        title: const Text("New Post", 
          style: TextStyle(fontWeight: FontWeight.bold)
        ),
        actions: [
          IconButton(
            onPressed: () async {
              if (_postMessage.isNotEmpty) {
                Post newPost = Post(
                  user: currentUser,
                  message: _postMessage,
                  timePosted: DateTime.now(),
                  parentPost: widget.mainPost
                );
                setState(() {
                  posts.add(newPost);
                });

                Navigator.push(context, 
                  MaterialPageRoute(builder: (context) {
                    return widget.mainPost == null
                      ? NavigationTab()
                      : PostScreen(post: widget.mainPost);
                  })
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please type something!')));
              }
            },
            icon: const Icon(Icons.chevron_right, size: 30)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          height: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: CircleAvatar(
                  backgroundImage: currentUser.profilePicture.image,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextField(
                  autofocus: true,
                  maxLength: 240,
                  maxLines: 999999,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Message",
                    counterText: ""
                  ),
                  style: const TextStyle(
                    fontSize: 20
                  ),
                  onChanged: (value) {
                    setState(() => _postMessage = value);
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: CircularProgressIndicator(
        value: _postMessage.length / 240,
      ),
    );
  }
}
