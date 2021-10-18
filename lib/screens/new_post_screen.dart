import 'package:chika/database/post.dart';
import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  String _postMessage = "";
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF0056D7),
          centerTitle: true,
          title: const Text("New Post")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            TextField(
              maxLength: 240,
              maxLines: 7,
              decoration: const InputDecoration(
                hintText: "Message",
              ),
              onChanged: (value) {
                _postMessage = value;
              },
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  _loading = true;
                });
                if (_postMessage != null && _postMessage.isNotEmpty) {
                  Post newPost = Post(_postMessage, "admin");
                  Navigator.pop(context);
                  setState(() {
                    _loading = false;
                  });  
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please type something!')));
                }
              },
              child: const Text("Publish Post"),
              style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF0056D7),
                  shape: const StadiumBorder()),
            )
          ],
        ),
      ),
    );
  }
}
