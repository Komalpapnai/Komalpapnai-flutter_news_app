class Article {
  String title;
  String description;
  String imageUrl;
  String source;
  String date;

  Article({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.source,
    required this.date,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      imageUrl: json['urlToImage'] ?? "",
      source: json['source']?['name'] ?? "",
      date: json['publishedAt'] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "description": description,
      "image": imageUrl,
      "source": source,
      "date": date
    };
  }
}