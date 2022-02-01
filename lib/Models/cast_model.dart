// To parse this JSON data, do
//
//     final castModel = castModelFromJson(jsonString);

import 'dart:convert';

CastModel castModelFromJson(String str) => CastModel.fromJson(json.decode(str));

String castModelToJson(CastModel data) => json.encode(data.toJson());

class CastModel {
  CastModel({
    required this.id,
    required this.cast,
    // required this.crew,
  });

  int id;
  List<Cast> cast;
  // List<Cast> crew;

  factory CastModel.fromJson(Map<String, dynamic> json) => CastModel(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
        // crew: List<Cast>.from(json["crew"].map((x) => Cast.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
        // "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
      };
}

class Cast {
  Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
    required this.department,
    required this.job,
  });

  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;
  String? department;
  String? job;

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"],
        castId: json["cast_id"] ?? 'null',
        character: json["character"] ?? 'null',
        creditId: json["credit_id"],
        order: json["order"] ?? 'null',
        department: json["department"] ?? 'null',
        job: json["job"] ?? 'null',
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": knownForDepartment,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath ?? 'null',
        "cast_id": castId ?? 'null',
        "character": character ?? 'null',
        "credit_id": creditId,
        "order": order ?? 'null',
        "department": department ?? 'null',
        "job": job ?? 'null',
      };
}
