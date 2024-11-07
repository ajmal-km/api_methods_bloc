// To parse this JSON data, do
//
//     final userResModel = userResModelFromJson(jsonString);

import 'dart:convert';

UserResModel userResModelFromJson(String str) =>
    UserResModel.fromJson(json.decode(str));

String userResModelToJson(UserResModel data) => json.encode(data.toJson());

class UserResModel {
  String? refresh;
  String? access;
  int? id;
  String? name;
  String? place;
  String? email;

  UserResModel({
    this.refresh,
    this.access,
    this.id,
    this.name,
    this.place,
    this.email,
  });

  factory UserResModel.fromJson(Map<String, dynamic> json) => UserResModel(
        refresh: json["refresh"],
        access: json["access"],
        id: json["id"],
        name: json["name"],
        place: json["place"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
        "id": id,
        "name": name,
        "place": place,
        "email": email,
      };
}
