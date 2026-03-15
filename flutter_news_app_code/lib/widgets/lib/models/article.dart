import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Article {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String? author;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final String urlToImage;
  @HiveField(4)
  final String publishedAt;
  @HiveField(5)
  final String? content;
  @HiveField(6)
  final String sourceName;

  Article({
    required this.title,
    this.author,
    this.description,
    required this.urlToImage,
    required this.publishedAt,
    this.content,
    required this.sourceName,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? '',
      author: json['author'],
      description: json['description'],
      urlToImage: json['urlToImage'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      content: json['content'],
      sourceName: json['source'] != null ? json['source']['name'] : 'Unknown',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'description': description,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
      'source': {'name': sourceName},
    };
  }
}

// Manual Adapter to avoid build_runner for this task
class ArticleAdapter extends TypeAdapter<Article> {
  @override
  final int typeId = 0;

  @override
  Article read(BinaryReader reader) {
    return Article(
      title: reader.read(),
      author: reader.read(),
      description: reader.read(),
      urlToImage: reader.read(),
      publishedAt: reader.read(),
      content: reader.read(),
      sourceName: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Article obj) {
    writer.write(obj.title);
    writer.write(obj.author);
    writer.write(obj.description);
    writer.write(obj.urlToImage);
    writer.write(obj.publishedAt);
    writer.write(obj.content);
    writer.write(obj.sourceName);
  }
}
