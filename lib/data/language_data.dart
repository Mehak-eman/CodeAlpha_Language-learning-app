class LanguageData {
  static const Map<String, Map<String, dynamic>> data = {
    'Spanish': {
      'welcome': 'Welcome to Spanish!',
      'dailyLesson': 'Daily Spanish Lesson',
      'lessonTitle': 'Basic Spanish Phrases',
      'words': [
        {
          'word': 'Hola',
          'meaning': 'Hello',
          'pronunciation': 'OH-lah',
        },
        {
          'word': 'Gracias',
          'meaning': 'Thank you',
          'pronunciation': 'GRAH-see-ahs',
        },
        {
          'word': 'Adiós',
          'meaning': 'Goodbye',
          'pronunciation': 'ah-dee-OHS',
        },
        {
          'word': 'Por favor',
          'meaning': 'Please',
          'pronunciation': 'por fah-VOR',
        },
        {
          'word': 'Buenos días',
          'meaning': 'Good morning',
          'pronunciation': 'BWEH-nos DEE-ahs',
        },
      ],
    },

    'French': {
      'welcome': 'Welcome to French!',
      'dailyLesson': 'Daily French Lesson',
      'lessonTitle': 'Basic French Phrases',
      'words': [
        {
          'word': 'Bonjour',
          'meaning': 'Hello',
          'pronunciation': 'bon-ZHOOR',
        },
        {
          'word': 'Merci',
          'meaning': 'Thank you',
          'pronunciation': 'mehr-SEE',
        },
        {
          'word': 'Au revoir',
          'meaning': 'Goodbye',
          'pronunciation': 'oh ruh-VWAR',
        },
        {
          'word': "S'il vous plaît",
          'meaning': 'Please',
          'pronunciation': 'seel voo PLEH',
        },
        {
          'word': 'Bonsoir',
          'meaning': 'Good evening',
          'pronunciation': 'bon-SWAHR',
        },
      ],
    },

    'English': {
      'welcome': 'Welcome to English!',
      'dailyLesson': 'Daily English Lesson',
      'lessonTitle': 'Basic English Phrases',
      'words': [
        {
          'word': 'Hello',
          'meaning': 'Hello',
          'pronunciation': 'heh-LOH',
        },
        {
          'word': 'Thank you',
          'meaning': 'Thank you',
          'pronunciation': 'THANK yoo',
        },
        {
          'word': 'Goodbye',
          'meaning': 'Goodbye',
          'pronunciation': 'good-BYE',
        },
        {
          'word': 'Please',
          'meaning': 'Please',
          'pronunciation': 'PLEEZ',
        },
        {
          'word': 'Good morning',
          'meaning': 'Good morning',
          'pronunciation': 'good MOR-ning',
        },
      ],
    },
  };

  static Map<String, dynamic> getLanguage(String language) {
    return data[language] ?? data['Spanish']!;
  }
}