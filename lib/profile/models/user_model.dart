

import 'package:meta/meta.dart';
import 'dart:convert';

class UserModels {
  final String id;
  final String name;
  final String moblile;

  UserModels({
    required this.id,
    required this.name,
    required this.moblile,
  });

  factory UserModels.fromRawJson(String str) => UserModels.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModels.fromJson(Map<String, dynamic> json) => UserModels(
    id: json["id"],
    name: json["name"],
    moblile: json["moblile"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "moblile": moblile,
  };
}
