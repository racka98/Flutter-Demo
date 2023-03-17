class Post {
  int userId;
  int id;
  String title;
  String body;
  int likes;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    required this.likes,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body'],
        likes: 0,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
