import 'package:intl/intl.dart';

class NewsModel {
  final String title;
  final String description;
  String author;
  final NewsCategory cat;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;

  NewsModel({
    this.author = "",
    required this.cat,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  }) {
    author = _getCategoryString(cat);
  }

  NewsCategory GetCategory() {
    return cat;
  }

  String GetCategoryString() {
    return _getCategoryString(cat);
  }

  GetPublishedDateFormatted() {
    final DateFormat formatter = DateFormat('d MMM');
    final String formatted = formatter.format(publishedAt);
    return formatted;
  }

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        title: json['title'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: json['publishedAt'],
        author: json['author'] ?? 'Unknown',
        cat: _getCategory(json['category']));
  }
}

// Return Enum value from String
_getCategory(json) {
  switch (json) {
    case 'SA':
      return NewsCategory.sa;
    case 'FOSE':
      return NewsCategory.fose;
    case 'FASS':
      return NewsCategory.fass;
    case 'CAREERS':
      return NewsCategory.careers;
    default:
      return NewsCategory.sa;
  }
}

// Return String from Enum value
_getCategoryString(NewsCategory cat) {
  switch (cat) {
    case NewsCategory.sa:
      return 'SA';
    case NewsCategory.fose:
      return 'FOSE';
    case NewsCategory.fass:
      return 'FASS';
    case NewsCategory.careers:
      return 'CAREERS';
    default:
      return 'ALL';
  }
}

// Generate Enum to determine Category
enum NewsCategory { sa, fose, fass, careers }
