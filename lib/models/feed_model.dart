import 'dart:convert';

Feed feedFromJson(String str) => Feed.fromJson(json.decode(str));

String feedToJson(Feed data) => json.encode(data.toJson());

class Feed {
  Feed({
    this.feed,
    this.feedTotal,
  });


  List<FeedElement> feed;
  int feedTotal;

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
    feed: json["feed"] == null ? null : List<FeedElement>.from(json["feed"].map((x) => FeedElement.fromJson(x))),
    feedTotal: json["feedTotal"] == null ? null : json["feedTotal"],
  );

  Map<String, dynamic> toJson() => {
    "feed": feed == null ? null : List<dynamic>.from(feed.map((x) => x.toJson())),
    "feedTotal": feedTotal == null ? null : feedTotal,
  };

  @override
  String toString() {
    return 'Feed{feed: $feed, feedTotal: $feedTotal}';
  }
}

class FeedElement {
  FeedElement({
    this.cover,
    this.photo,
    this.name,
    this.followerCount,
    this.createdAt,
  });

  String cover;
  String photo;
  String name;
  String followerCount;
  String createdAt;

  factory FeedElement.fromJson(Map<String, dynamic> json) => FeedElement(
    cover: json["cover"] == null ? null : json["cover"],
    photo: json["photo"] == null ? null : json["photo"],
    name: json["Name"] == null ? null : json["Name"],
    followerCount: json["FollowerCount"] == null ? null : json["FollowerCount"],
    createdAt: json["CreatedAt"] == null ? null : json["CreatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "cover": cover == null ? null : cover,
    "photo": photo == null ? null : photo,
    "Name": name == null ? null : name,
    "FollowerCount": followerCount == null ? null : followerCount,
    "CreatedAt": createdAt == null ? null : createdAt,
  };

  @override
  String toString() {
    return 'FeedElement{cover: $cover, photo: $photo, name: $name, followerCount: $followerCount, createdAt: $createdAt}';
  }
}
