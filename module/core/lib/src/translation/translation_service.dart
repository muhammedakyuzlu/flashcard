import 'dart:convert';

import 'package:core/src/translation/translation_enum.dart';
import 'package:http/http.dart' as http;


/// A singleton class that provides translation services using Google Translate's mobile web interface.
///
/// This class allows setting the source and target languages using the [Language] enum and performs translations
/// based on the current language settings.
class TranslationService {
  /// Factory constructor to return the singleton instance.
  factory TranslationService() => _instance;

  /// Private constructor for singleton pattern.
  TranslationService._internal();

  /// The single instance of the TranslationService.
  static final TranslationService _instance = TranslationService._internal();

  /// The source language, defaults to Chinese (zh-CN).
  TranslationLanguage _from = TranslationLanguage.zhCN;

  /// The target language, defaults to English (en).
  TranslationLanguage _to = TranslationLanguage.en;

  /// Gets the current source language.
  TranslationLanguage get from => _from;

  /// Sets the source language.
  set from(TranslationLanguage value) => _from = value;

  /// Gets the current target language.
  TranslationLanguage get to => _to;

  /// Sets the target language.
  set to(TranslationLanguage value) => _to = value;

  /// Translates the given [text] from the current source language to the current target language.
  ///
  /// [text]: The text to translate.
  /// [client]: An optional HTTP client to use for the request. If not provided,
  /// a default client will be used.
  ///
  /// Returns the translated text, or an empty string if an error occurs.
  Future<String> translate(String text, {http.Client? client}) async {
    final httpClient = client ?? http.Client();
    final url = Uri.parse(
      'https://translate.google.com/m?sl=${_from.code}&tl=${_to.code}&q=${Uri.encodeComponent(text)}',
    );

    try {
      final response = await httpClient.get(
        url,
        headers: {
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
          'Accept-Charset': 'utf-8',
        },
      );

      if (response.statusCode == 200) {
        final body = utf8.decode(response.bodyBytes, allowMalformed: true);
        final regex = RegExp(
          r'<div class="result-container">(.*?)</div>',
          dotAll: true,
        );
        final match = regex.firstMatch(body);
        if (match != null) {
          return match.group(1)!.trim();
        } else {
          throw Exception('Translation not found in response.');
        }
      } else {
        throw Exception('Failed to load translation: ${response.statusCode}');
      }
    } catch (e) {
      return '';
    } finally {
      if (client == null) httpClient.close();
    }
  }
}
