import 'package:clean_architecture/features/daily_news/domain/entities/article_entity.dart';

// why need to extend ArticleEntity here?
// because in data layer repository class it will need to implement the body for functions defined in domain layer repository interfaces
// the domain layer repo interface using ArticleEntity
// but data layer should only use ArticleModel
// so our model class extends entity class so that the repo classes can obey its interface promises
class ArticleModel extends ArticleEntity {
  const ArticleModel({
    int? id,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      author: map['author']?.toString() ?? '',
      title: map['title']?.toString() ?? '',
      description: map['description']?.toString() ?? '',
      url: map['url']?.toString() ?? '',
      urlToImage: map['urlToImage']?.toString() ?? '',
      publishedAt: map['publishedAt']?.toString() ?? '',
      content: map['content']?.toString() ?? '',
    );
  }

}