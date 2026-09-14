class GrammarData {
  static const Map<String, List<Map<String, String>>> data = {
    'Spanish': [
      {
        'title': 'Basic Sentence Structure',
        'rule': 'Subject + Verb + Object',
        'example': 'Yo como una manzana.',
        'translation': 'I eat an apple.',
      },
      {
        'title': 'Personal Pronouns',
        'rule': 'Yo = I, Tú = You, Él = He, Ella = She',
        'example': 'Yo soy estudiante.',
        'translation': 'I am a student.',
      },
      {
        'title': 'Present Tense',
        'rule': 'Use the present form for actions happening now.',
        'example': 'Ella estudia español.',
        'translation': 'She studies Spanish.',
      },
    ],
    'French': [
      {
        'title': 'Basic Sentence Structure',
        'rule': 'Subject + Verb + Object',
        'example': 'Je mange une pomme.',
        'translation': 'I eat an apple.',
      },
      {
        'title': 'Personal Pronouns',
        'rule': 'Je = I, Tu = You, Il = He, Elle = She',
        'example': 'Je suis étudiant.',
        'translation': 'I am a student.',
      },
      {
        'title': 'Present Tense',
        'rule': 'Use the present form for actions happening now.',
        'example': 'Elle étudie le français.',
        'translation': 'She studies French.',
      },
    ],
    'English': [
      {
        'title': 'Basic Sentence Structure',
        'rule': 'Subject + Verb + Object',
        'example': 'I eat an apple.',
        'translation': 'I eat an apple.',
      },
      {
        'title': 'Personal Pronouns',
        'rule': 'I = speaker, You = listener, He/She = another person',
        'example': 'I am a student.',
        'translation': 'I am a student.',
      },
      {
        'title': 'Present Tense',
        'rule': 'Use the present tense for regular or current actions.',
        'example': 'She studies English.',
        'translation': 'She studies English.',
      },
    ],
  };

  static List<Map<String, String>> getGrammar(String language) {
    return data[language] ?? data['Spanish']!;
  }
}