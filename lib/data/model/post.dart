import 'package:flutter_blog/data/model/user.dart';
import 'package:intl/intl.dart';

class Post {
  int id;
  String title;
  String content;
  User user;
  DateTime created;
  DateTime updated;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.user,
    required this.created,
    required this.updated,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "user": user,
        "created": created,
        "updated": updated,
      };

  Post.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        content = json["content"],
        user = json["user"],
        created = DateFormat("yyyy-mm-dd").parse(json["created"]),
        updated = DateFormat("yyyy-mm-dd").parse(json["updated"]);
}
