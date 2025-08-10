import 'flash_card_model.dart';

mixin FlashcardData{
  final Deck data = const Deck(
    categories: [
      Category(
        uuid: '1',
        name: 'Chinese',
        flashcards: [
          Flashcard(
            uuid: '1',
            keyword: '对不起',
            translation: 'Sorry',
          ),
          Flashcard(
            uuid: '2',
            keyword: '谢谢',
            translation: 'Thank you',
          ),
        ],
      ),
    ],
  );
} 
