import 'package:chika/database/user.dart';

class Post {
  User user;
  String message;
  DateTime timePosted;

  Post({
    required this.user, 
    required this.message, 
    required this.timePosted
  });

  String get timeDisplay {
    Duration timeDiff = DateTime.now().difference(timePosted);
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

List<Post> posts = [
  Post(
    user: users[0], 
    message: "Hi sir gikapoy nako'g code ahihi",
    timePosted: DateTime.now()
  ),
  Post(
    user: users[4], 
    message: "w0000000",
    timePosted: DateTime.now()
  ),
  Post(
    user: users[1], 
    message: "A post with a very looooooooooooooooooooooooooooooong message",
    timePosted: DateTime.now()
  )
];
