import 'package:chika/database/user.dart';

class Post {
  User user;
  String message;

  Post(this.user, this.message);
}

List<Post> posts = [
  Post(users[0], "Hi sir gikapoy nako'g code ahihi"),
  Post(users[4], "w0000000"),
  Post(users[1], "A post with a very looooooooooooooooooooooooooooooong message")
];
