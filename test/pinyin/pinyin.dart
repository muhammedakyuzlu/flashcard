import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pinyin/pinyin.dart';



void main() {
  setUp(() {});

  group('pinyin test', () {
    test('Pinyin', () async {
      const strChinese = '你好，我叫穆罕默德';
      const strPinyin = 'nǐ hǎo ， wǒ jiào mù hǎn mò dé';

      final pinyin = PinyinHelper.getPinyin(
        strChinese,
        format: PinyinFormat.WITH_TONE_MARK,
      );
      if (kDebugMode) {
        print('Pinyin: $pinyin');
      }
      expect(pinyin, strPinyin);
    });
  });
}
