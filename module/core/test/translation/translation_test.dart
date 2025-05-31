import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  group('Translation test', () {

    test('Translation from Chinese to English', () async {
      final translationService = TranslationService()
      ..from = TranslationLanguage.zhCN
      ..to = TranslationLanguage.en;

      final translatedText = await translationService.translate('你好，我叫穆罕默德');

      if (kDebugMode) {
        print('Translated Text: $translatedText');
      }
      expect(translatedText, 'Hello, my name is Mohammed');


      // change to Arabic
      translationService.to = TranslationLanguage.ar;
      final translatedTextArabic = await translationService.translate('你好，我叫穆罕默德');
      if (kDebugMode) {
        print('Translated Text Arabic: $translatedTextArabic');
      }
      expect(translatedTextArabic, 'مرحبًا ، اسمي محمد');
    });
  });
}
