import 'dart:convert';

class UserModel {
  final String name;
  final String photoUrl;

  UserModel({required this.name, required this.photoUrl});

  Map<String, dynamic> toMap() => {"name": name, "photoUrl": photoUrl};

  factory UserModel.fromMap(Map<String, dynamic> map) =>
      UserModel(name: map["name"], photoUrl: map["photoUrl"]);

  factory UserModel.fromJSON(String json) =>
      UserModel.fromMap(jsonDecode(json));

  toJSON() => jsonEncode(toMap());

  fromJSON(String json) => jsonDecode(json);
}
