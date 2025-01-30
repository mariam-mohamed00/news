class Source {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  Source(
      {this.id,
      this.name,
      this.description,
      this.url,
      this.category,
      this.language,
      this.country});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["description"] = description;
    map["url"] = url;
    map["category"] = category;
    map["language"] = language;
    map["country"] = country;
    return map;
  }

  Source.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    url = json["url"];
    category = json["category"];
    language = json["language"];
    country = json["country"];
  }
}

class SourceResponse {
  String? status;
  List<Source>? sourcesList;
  String? message;
  String? code;
  SourceResponse({this.status, this.sourcesList, this.message, this.code});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["status"] = status;
    map["message"] = message;
    map["code"] = code;
    if (sourcesList != null) {
      map["sources"] = sourcesList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  SourceResponse.fromJson(dynamic json) {
    status = json["status"];
    message = json["message"];
    code = json["code"];
    if (json["sources"] != null) {
      sourcesList = [];
      json["sources"].forEach((v) {
        sourcesList?.add(Source.fromJson(v));
      });
    }
  }
}
