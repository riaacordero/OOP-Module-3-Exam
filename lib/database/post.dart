class Post {
  String username;
  String message;

  Post(this.username, this.message);
}

List<Post> post = postData
    .map(
      (item) => Post(
          item['username'] as String,
          item['message'] as String,
      ),
    ).toList();

var postData = [
  {
    "username": "riaacordero",
    "message": "Hi sir gikapoy nakog code ahihi",
  },
  {
    "username": "hrjugar",
    "message": "w000000",
  }
];
