class AppConstants {
  static const String appName = 'LingoLearn';

  static const List<Map<String, String>> languages = [
    {
      'name': 'English',
      'flag': '🇬🇧',
      'code': 'en',
    },
    {
      'name': 'Spanish',
      'flag': '🇪🇸',
      'code': 'es',
    },
    {
      'name': 'French',
      'flag': '🇫🇷',
      'code': 'fr',
    },
  ];

  static const List<Map<String, dynamic>> categories = [
    {
      'title': 'Vocabulary',
      'icon': '📖',
    },
    {
      'title': 'Common Phrases',
      'icon': '💬',
    },
    {
      'title': 'Grammar',
      'icon': '📐',
    },
    {
      'title': 'Numbers',
      'icon': '🔢',
    },
    {
      'title': 'Travel',
      'icon': '✈️',
    },
    {
      'title': 'Food',
      'icon': '🍎',
    },
  ];
}