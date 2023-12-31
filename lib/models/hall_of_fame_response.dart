import 'dart:convert';
import 'package:intl/intl.dart';

class HallOfFameResponse {
  String name;
  int id;
  DateTime firstReleaseDate;
  Tier tier;
  Images images;
  int topCriticScore;

  HallOfFameResponse({
    required this.name,
    required this.id,
    required this.firstReleaseDate,
    required this.tier,
    required this.images,
    required this.topCriticScore,
  });

  factory HallOfFameResponse.fromRawJson(String str) =>
      HallOfFameResponse.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  factory HallOfFameResponse.fromJson(Map<String, dynamic> json) =>
      HallOfFameResponse(
        name: json["name"],
        id: json["id"],
        //firstReleaseDate: DateTime.parse(json["firstReleaseDate"]),
        firstReleaseDate: _parseDate(json["firstReleaseDate"]),
        tier: tierValues.map[json["tier"]]!,
        images: Images.fromJson(json["images"]),
        topCriticScore: json["topCriticScore"],
      );

  static DateTime _parseDate(dynamic dateString) {
    DateTime parsedDate = DateTime.parse(dateString);
    return parsedDate;
  }

  String getFormattedDate() {
    DateFormat formatter = DateFormat('yyyy MMMM d');
    return formatter.format(firstReleaseDate);
  }

  /*Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "firstReleaseDate": firstReleaseDate.toIso8601String(),
        "tier": tierValues.reverse[tier],
        "images": images.toJson(),
        "topCriticScore": topCriticScore,
      };*/
}

class Images {
  Banner box;
  Banner banner;

  Images({
    required this.box,
    required this.banner,
  });

  factory Images.fromRawJson(String str) => Images.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        box: Banner.fromJson(json["box"]),
        banner: Banner.fromJson(json["banner"]),
      );

  /*Map<String, dynamic> toJson() => {
        "box": box.toJson(),
        "banner": banner.toJson(),
      };*/
}

class Banner {
  String og;
  String sm;

  Banner({
    required this.og,
    required this.sm,
  });

  factory Banner.fromRawJson(String str) => Banner.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        og: json["og"],
        sm: json["sm"],
      );

  /*Map<String, dynamic> toJson() => {
        "og": og,
        "sm": sm,
      };*/
}

enum Tier { Mighty }

final tierValues = EnumValues({"Mighty": Tier.Mighty});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
