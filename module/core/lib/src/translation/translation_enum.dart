/// Enum representing supported languages for translation.
enum TranslationLanguage {
  ar('ar'), // Arabic
  en('en'), // English
  zhCN('zh-CN'), // Chinese (Simplified)
  ja('ja'); // Japanese

  const TranslationLanguage(this.code);
  final String code;
}
