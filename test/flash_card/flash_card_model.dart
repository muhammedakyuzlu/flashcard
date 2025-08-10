import 'package:vexana/vexana.dart';

// Deck  are list of categories, each category contains a list of flashcards.
class Deck extends INetworkModel<Deck> {
  const Deck({this.categories,this.uuid});
  
  factory Deck.fromJson(Map<String, dynamic> json) {
    return Deck(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      uuid: json['uuid'] as String?,
    );
  }

  final List<Category>? categories;
  final String? uuid;

  @override
  Deck fromJson(Map<String, dynamic> json) => Deck.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _toJson();

  Map<String, dynamic> _toJson() {
    return {'categories': categories, 'uuid': uuid};
  }
}

class Category extends INetworkModel<Category> {
  const Category({this.uuid, this.name, this.flashcards});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      flashcards:
          (json['flashcards'] as List<dynamic>?)
              ?.map((e) => Flashcard.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }
  final String? uuid;
  final String? name;
  final List<Flashcard>? flashcards;

  @override
  Category fromJson(Map<String, dynamic> json) => Category.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _toJson();

  Map<String, dynamic> _toJson() {
    return {'name': name, 'flashcards': flashcards, 'uuid': uuid};
  }
}

final class Flashcard extends INetworkModel<Flashcard> {
  const Flashcard({this.uuid, this.keyword, this.translation});

  factory Flashcard.fromJson(Map<String, dynamic> json) {
    return Flashcard(
      uuid: json['uuid'] as String?,
      keyword: json['keyword'] as String?,
      translation: json['translation'] as String?,
    );
  }

  final String? uuid;
  final String? keyword;
  final String? translation;

  @override
  Flashcard fromJson(Map<String, dynamic> json) => Flashcard.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _toJson();

  Map<String, dynamic> _toJson() {
    return {'uuid': uuid, 'keyword': keyword, 'translation': translation};
  }
}
