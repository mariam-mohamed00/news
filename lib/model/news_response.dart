import 'package:news_app/model/source_response.dart';

class News {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urltoimage;
  String? publishedat;
  String? content;

  News(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urltoimage,
      this.publishedat,
      this.content});

 

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map["source"] = source?.toJson();
    }
    map["author"] = author;
    map["title"] = title;
    map["description"] = description;
    map["url"] = url;
    map["urlToImage"] = urltoimage;
    map["publishedAt"] = publishedat;
    map["content"] = content;
    return map;
  }

  News.fromJson(dynamic json) {
    source = json["source"] != null ? Source.fromJson(json["source"]) : null;
    author = json["author"];
    title = json["title"];
    description = json["description"];
    url = json["url"];
    urltoimage = json["urlToImage"];
    publishedat = json["publishedAt"];
    content = json["content"];
  }
}

class NewsResponse {
  String? status; 
  String? code; 
  String? message; 
  num? totalresults;
  List<News>? articlesList;

  NewsResponse({this.status, this.totalresults, this.articlesList, this.code, this.message});



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["status"] = status;
    map["code"] = code;
    map["message"] = message;
    map["totalResults"] = totalresults;
    if (articlesList != null) {
      map["articles"] = articlesList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  NewsResponse.fromJson(dynamic json) {
    status = json["status"]; 
    code = json["code"]; 
    message = json["message"]; 
    totalresults = json["totalResults"];
    if (json["articles"] != null) {
      articlesList = [];
      json["articles"].forEach((v) {
        articlesList?.add(News.fromJson(v));
      });
    }
  }
}
