class User {
  int id;
  String name;
  String username;

  User({required this.id, required this.name, required this.username});

  User.initial()
      : id = 0,
        name = '',
        username = '';

  static User? fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final name = json['name'];
    final username = json['username'];
    if (id == null || name == null || username == null) return null;
    return User(
      id: id,
      name: name,
      username: username,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    return data;
  }
}
