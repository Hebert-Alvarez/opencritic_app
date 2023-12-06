import 'dart:convert';

class Game {
  //Images
  Images images;
  Rating rating;
  bool hasLootBoxes;
  double percentRecommended;
  int numReviews;
  int numTopCriticReviews;
  int medianScore;
  //TopCriticScore
  double topCriticScore;
  int percentile;
  //Tier
  String tier;
  //Name
  String name;
  String description;
  List<GameScreenshot> screenshots;
  List<Trailer> trailers;
  Screenshot mastheadScreenshot;
  dynamic embargoDate;
  List<Company> companies;
  List<Platform> platforms;
  List<Genre> genres;
  List<Affiliate> affiliates;
  //GameId
  int id;
  //FirstReleaseDate
  DateTime firstReleaseDate;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime firstReviewDate;
  DateTime latestReviewDate;
  Screenshot logoScreenshot;
  BannerScreenshot bannerScreenshot;
  Screenshot squareScreenshot;
  Screenshot verticalLogoScreenshot;
  bool imageMigrationComplete;
  DateTime tenthReviewDate;
  DateTime criticalReviewDate;
  String url;

  Game({
    required this.images,
    required this.rating,
    required this.hasLootBoxes,
    required this.percentRecommended,
    required this.numReviews,
    required this.numTopCriticReviews,
    required this.medianScore,
    required this.topCriticScore,
    required this.percentile,
    required this.tier,
    required this.name,
    required this.description,
    required this.screenshots,
    required this.trailers,
    required this.mastheadScreenshot,
    required this.embargoDate,
    required this.companies,
    required this.platforms,
    required this.genres,
    required this.affiliates,
    required this.id,
    required this.firstReleaseDate,
    required this.createdAt,
    required this.updatedAt,
    required this.firstReviewDate,
    required this.latestReviewDate,
    required this.logoScreenshot,
    required this.bannerScreenshot,
    required this.squareScreenshot,
    required this.verticalLogoScreenshot,
    required this.imageMigrationComplete,
    required this.tenthReviewDate,
    required this.criticalReviewDate,
    required this.url,
  });

  factory Game.fromRawJson(String str) => Game.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        images: Images.fromJson(json["images"]),
        rating: Rating.fromJson(json["Rating"]),
        hasLootBoxes: json["hasLootBoxes"],
        percentRecommended: json["percentRecommended"]?.toDouble(),
        numReviews: json["numReviews"],
        numTopCriticReviews: json["numTopCriticReviews"],
        medianScore: json["medianScore"],
        topCriticScore: json["topCriticScore"]?.toDouble(),
        percentile: json["percentile"],
        tier: json["tier"],
        name: json["name"],
        description: json["description"],
        screenshots: List<GameScreenshot>.from(
            json["screenshots"].map((x) => GameScreenshot.fromJson(x))),
        trailers: List<Trailer>.from(
            json["trailers"].map((x) => Trailer.fromJson(x))),
        mastheadScreenshot: Screenshot.fromJson(json["mastheadScreenshot"]),
        embargoDate: json["embargoDate"],
        companies: List<Company>.from(
            json["Companies"].map((x) => Company.fromJson(x))),
        platforms: List<Platform>.from(
            json["Platforms"].map((x) => Platform.fromJson(x))),
        genres: List<Genre>.from(json["Genres"].map((x) => Genre.fromJson(x))),
        affiliates: List<Affiliate>.from(
            json["Affiliates"].map((x) => Affiliate.fromJson(x))),
        id: json["id"],
        firstReleaseDate: DateTime.parse(json["firstReleaseDate"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        firstReviewDate: DateTime.parse(json["firstReviewDate"]),
        latestReviewDate: DateTime.parse(json["latestReviewDate"]),
        logoScreenshot: Screenshot.fromJson(json["logoScreenshot"]),
        bannerScreenshot: BannerScreenshot.fromJson(json["bannerScreenshot"]),
        squareScreenshot: Screenshot.fromJson(json["squareScreenshot"]),
        verticalLogoScreenshot:
            Screenshot.fromJson(json["verticalLogoScreenshot"]),
        imageMigrationComplete: json["imageMigrationComplete"],
        tenthReviewDate: DateTime.parse(json["tenthReviewDate"]),
        criticalReviewDate: DateTime.parse(json["criticalReviewDate"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "images": images.toJson(),
        "Rating": rating.toJson(),
        "hasLootBoxes": hasLootBoxes,
        "percentRecommended": percentRecommended,
        "numReviews": numReviews,
        "numTopCriticReviews": numTopCriticReviews,
        "medianScore": medianScore,
        "topCriticScore": topCriticScore,
        "percentile": percentile,
        "tier": tier,
        "name": name,
        "description": description,
        "screenshots": List<dynamic>.from(screenshots.map((x) => x.toJson())),
        "trailers": List<dynamic>.from(trailers.map((x) => x.toJson())),
        "mastheadScreenshot": mastheadScreenshot.toJson(),
        "embargoDate": embargoDate,
        "Companies": List<dynamic>.from(companies.map((x) => x.toJson())),
        "Platforms": List<dynamic>.from(platforms.map((x) => x.toJson())),
        "Genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "Affiliates": List<dynamic>.from(affiliates.map((x) => x.toJson())),
        "id": id,
        "firstReleaseDate": firstReleaseDate.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "firstReviewDate": firstReviewDate.toIso8601String(),
        "latestReviewDate": latestReviewDate.toIso8601String(),
        "logoScreenshot": logoScreenshot.toJson(),
        "bannerScreenshot": bannerScreenshot.toJson(),
        "squareScreenshot": squareScreenshot.toJson(),
        "verticalLogoScreenshot": verticalLogoScreenshot.toJson(),
        "imageMigrationComplete": imageMigrationComplete,
        "tenthReviewDate": tenthReviewDate.toIso8601String(),
        "criticalReviewDate": criticalReviewDate.toIso8601String(),
        "url": url,
      };
}

class Affiliate {
  String externalUrl;
  String name;

  Affiliate({
    required this.externalUrl,
    required this.name,
  });

  factory Affiliate.fromRawJson(String str) =>
      Affiliate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Affiliate.fromJson(Map<String, dynamic> json) => Affiliate(
        externalUrl: json["externalUrl"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "externalUrl": externalUrl,
        "name": name,
      };
}

class BannerScreenshot {
  String fullRes;

  BannerScreenshot({
    required this.fullRes,
  });

  factory BannerScreenshot.fromRawJson(String str) =>
      BannerScreenshot.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BannerScreenshot.fromJson(Map<String, dynamic> json) =>
      BannerScreenshot(
        fullRes: json["fullRes"],
      );

  Map<String, dynamic> toJson() => {
        "fullRes": fullRes,
      };
}

class Company {
  String name;
  String type;

  Company({
    required this.name,
    required this.type,
  });

  factory Company.fromRawJson(String str) => Company.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
      };
}

class Genre {
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromRawJson(String str) => Genre.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Images {
  Banner box;
  Square square;
  Masthead masthead;
  Banner banner;
  Logo logo;
  List<ImagesScreenshot> screenshots;

  Images({
    required this.box,
    required this.square,
    required this.masthead,
    required this.banner,
    required this.logo,
    required this.screenshots,
  });

  factory Images.fromRawJson(String str) => Images.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        box: Banner.fromJson(json["box"]),
        square: Square.fromJson(json["square"]),
        masthead: Masthead.fromJson(json["masthead"]),
        banner: Banner.fromJson(json["banner"]),
        logo: Logo.fromJson(json["logo"]),
        screenshots: List<ImagesScreenshot>.from(
            json["screenshots"].map((x) => ImagesScreenshot.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "box": box.toJson(),
        "square": square.toJson(),
        "masthead": masthead.toJson(),
        "banner": banner.toJson(),
        "logo": logo.toJson(),
        "screenshots": List<dynamic>.from(screenshots.map((x) => x.toJson())),
      };
}

class Banner {
  String og;
  String sm;

  Banner({
    required this.og,
    required this.sm,
  });

  factory Banner.fromRawJson(String str) => Banner.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        og: json["og"],
        sm: json["sm"],
      );

  Map<String, dynamic> toJson() => {
        "og": og,
        "sm": sm,
      };
}

class Logo {
  String og;

  Logo({
    required this.og,
  });

  factory Logo.fromRawJson(String str) => Logo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Logo.fromJson(Map<String, dynamic> json) => Logo(
        og: json["og"],
      );

  Map<String, dynamic> toJson() => {
        "og": og,
      };
}

class Masthead {
  String og;
  String xs;
  String sm;
  String md;
  String lg;
  String xl;

  Masthead({
    required this.og,
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
  });

  factory Masthead.fromRawJson(String str) =>
      Masthead.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Masthead.fromJson(Map<String, dynamic> json) => Masthead(
        og: json["og"],
        xs: json["xs"],
        sm: json["sm"],
        md: json["md"],
        lg: json["lg"],
        xl: json["xl"],
      );

  Map<String, dynamic> toJson() => {
        "og": og,
        "xs": xs,
        "sm": sm,
        "md": md,
        "lg": lg,
        "xl": xl,
      };
}

class ImagesScreenshot {
  String id;
  String og;
  String sm;

  ImagesScreenshot({
    required this.id,
    required this.og,
    required this.sm,
  });

  factory ImagesScreenshot.fromRawJson(String str) =>
      ImagesScreenshot.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImagesScreenshot.fromJson(Map<String, dynamic> json) =>
      ImagesScreenshot(
        id: json["_id"],
        og: json["og"],
        sm: json["sm"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "og": og,
        "sm": sm,
      };
}

class Square {
  String og;
  String xs;
  String sm;
  String lg;

  Square({
    required this.og,
    required this.xs,
    required this.sm,
    required this.lg,
  });

  factory Square.fromRawJson(String str) => Square.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Square.fromJson(Map<String, dynamic> json) => Square(
        og: json["og"],
        xs: json["xs"],
        sm: json["sm"],
        lg: json["lg"],
      );

  Map<String, dynamic> toJson() => {
        "og": og,
        "xs": xs,
        "sm": sm,
        "lg": lg,
      };
}

class Screenshot {
  String fullRes;
  String thumbnail;

  Screenshot({
    required this.fullRes,
    required this.thumbnail,
  });

  factory Screenshot.fromRawJson(String str) =>
      Screenshot.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Screenshot.fromJson(Map<String, dynamic> json) => Screenshot(
        fullRes: json["fullRes"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "fullRes": fullRes,
        "thumbnail": thumbnail,
      };
}

class Platform {
  int id;
  String name;
  String shortName;
  String imageSrc;
  DateTime releaseDate;
  dynamic displayRelease;

  Platform({
    required this.id,
    required this.name,
    required this.shortName,
    required this.imageSrc,
    required this.releaseDate,
    this.displayRelease,
  });

  factory Platform.fromRawJson(String str) =>
      Platform.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Platform.fromJson(Map<String, dynamic> json) => Platform(
        id: json["id"],
        name: json["name"],
        shortName: json["shortName"],
        imageSrc: json["imageSrc"],
        releaseDate: DateTime.parse(json["releaseDate"]),
        displayRelease: json["displayRelease"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "shortName": shortName,
        "imageSrc": imageSrc,
        "releaseDate": releaseDate.toIso8601String(),
        "displayRelease": displayRelease,
      };
}

class Rating {
  String imageSrc;

  Rating({
    required this.imageSrc,
  });

  factory Rating.fromRawJson(String str) => Rating.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        imageSrc: json["imageSrc"],
      );

  Map<String, dynamic> toJson() => {
        "imageSrc": imageSrc,
      };
}

class GameScreenshot {
  String id;
  String fullRes;
  String thumbnail;

  GameScreenshot({
    required this.id,
    required this.fullRes,
    required this.thumbnail,
  });

  factory GameScreenshot.fromRawJson(String str) =>
      GameScreenshot.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GameScreenshot.fromJson(Map<String, dynamic> json) => GameScreenshot(
        id: json["_id"],
        fullRes: json["fullRes"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullRes": fullRes,
        "thumbnail": thumbnail,
      };
}

class Trailer {
  String title;
  String videoId;
  String channelId;
  String description;
  String externalUrl;
  String channelTitle;
  DateTime publishedDate;

  Trailer({
    required this.title,
    required this.videoId,
    required this.channelId,
    required this.description,
    required this.externalUrl,
    required this.channelTitle,
    required this.publishedDate,
  });

  factory Trailer.fromRawJson(String str) => Trailer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Trailer.fromJson(Map<String, dynamic> json) => Trailer(
        title: json["title"],
        videoId: json["videoId"],
        channelId: json["channelId"],
        description: json["description"],
        externalUrl: json["externalUrl"],
        channelTitle: json["channelTitle"],
        publishedDate: DateTime.parse(json["publishedDate"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "videoId": videoId,
        "channelId": channelId,
        "description": description,
        "externalUrl": externalUrl,
        "channelTitle": channelTitle,
        "publishedDate": publishedDate.toIso8601String(),
      };
}
