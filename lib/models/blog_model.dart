import 'dart:convert';

class BlogModel {
  BlogModel({
    this.id,
    this.createdAt,
    this.title,
    this.imageUrl,
  });

  final String id;
  final DateTime createdAt;
  final String title;
  final String imageUrl;

  factory BlogModel.fromJson(String str) => BlogModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BlogModel.fromMap(Map<String, dynamic> json) => BlogModel(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        title: json["title"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "title": title,
        "imageUrl": imageUrl,
      };
}
