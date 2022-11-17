// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  late String? username;
  final int? id;
  final String name;
  final String desc;
  final bool done;

  User({
    this.username,
    this.id,
    required this.name,
    required this.desc,
    this.done = false,
  });

  User copyWith({
    String? username,
    int? id,
    String? name,
    String? desc,
    bool? done,
  }) {
    return User(
      username: username ?? this.username,
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      done: done ?? this.done,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'id': id,
      'name': name,
      'desc': desc,
      'done': done == false ? 0 : 1,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'],
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      done: map['done'] == 0 ? false : true,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'User(username: $username,  id: $id, name: $name, desc: $desc, done: $done)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.done == done;
  }

  @override
  int get hashCode =>
      username.hashCode ^
      id.hashCode ^
      name.hashCode ^
      desc.hashCode ^
      done.hashCode;
}
