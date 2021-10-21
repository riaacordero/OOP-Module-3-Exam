import 'package:chika/database/user.dart';

int _postId = 0;
class Post {
  int id;
  User user;
  String message;
  DateTime timePosted;
  Post? parentPost;

  Post({
    required this.user, 
    required this.message, 
    required this.timePosted,
    this.parentPost
  }) : id = _postId++;

  String get timeDisplay {
    Duration timeDiff = timePosted.difference(DateTime.now());
    if (timeDiff.inDays > 0) {
      return timeDiff.inDays.toString() + "d";
    } else if (timeDiff.inHours > 0) {
      return timeDiff.inHours.toString() + "h";
    } else if (timeDiff.inMinutes > 0) {
      return timeDiff.inMinutes.toString() + "m";
    } else if (timeDiff.inSeconds > 15) {
      return timeDiff.inSeconds.toString() + "s";
    } else {
      return "now";
    }
  }
}

List<Post> _initializePosts() {
  List<Post> tempPosts = [];
  Post post1 = Post(
    user: users[0], 
    message: "Hi sir gikapoy nako'g code ahihi",
    timePosted: DateTime(2021, 10, 21, 17, 32)
  );

  Post post2 = Post(
    user: users[4], 
    message: "w0000000",
    timePosted: DateTime(2021, 10, 22, 3, 44)
  );

  Post post3 = Post(
    user: users[1], 
    message: "A post with a very looooooooooooooooooooooooooooooong message",
    timePosted: DateTime(2021, 10, 22, 6, 7)
  );

  Post post4 = Post(
    user: users[2], 
    message: "Ako pud sir", 
    timePosted: DateTime(2021, 10, 22, 9, 23),
    parentPost: post1
  );

  Post post5 = Post(
    user: users[3],
    message: "Anong meron?",
    timePosted: DateTime(2021, 10, 22, 9, 47),
    parentPost: post2
  );

  tempPosts.addAll([post1, post2, post3, post4, post5]);
  return tempPosts;
}

List<Post> posts = _initializePosts();

List<Post> getPostChildren(Post? parentPost) {
  // if (parentPost == null || parentPost.parentPost == null) return [];
  // return posts.where((post) => post.parentPost!.id == parentPost.id).toList();
  if (parentPost == null) return [];
  return posts.where((post) => post.parentPost != null 
    && post.parentPost!.id == parentPost.id).toList();
}