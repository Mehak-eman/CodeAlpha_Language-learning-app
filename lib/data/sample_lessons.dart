import '../models/lesson_model.dart';
import '../models/word_model.dart';

class SampleLessons {
  static const List<LessonModel> spanishLessons = [
    LessonModel(
      id: 'lesson_1',
      title: 'Basic Conversations',
      category: 'Common Phrases',
      description: 'Learn some useful Spanish phrases.',
      words: [
        WordModel(
          word: 'Hola',
          translation: 'Hello',
          pronunciation: 'OH-la',
          example: 'Hola, ¿cómo estás?',
          category: 'Common Phrases',
        ),
        WordModel(
          word: 'Gracias',
          translation: 'Thank you',
          pronunciation: 'GRAH-see-ahs',
          example: 'Gracias por tu ayuda.',
          category: 'Common Phrases',
        ),
        WordModel(
          word: 'Adiós',
          translation: 'Goodbye',
          pronunciation: 'ah-dee-OHS',
          example: 'Adiós, nos vemos mañana.',
          category: 'Common Phrases',
        ),
        WordModel(
          word: 'Por favor',
          translation: 'Please',
          pronunciation: 'por fah-VOR',
          example: 'Un café, por favor.',
          category: 'Common Phrases',
        ),
        WordModel(
          word: 'Buenos días',
          translation: 'Good morning',
          pronunciation: 'BWEH-nos DEE-ahs',
          example: 'Buenos días, señor.',
          category: 'Common Phrases',
        ),
        WordModel(
          word: 'Buenas noches',
          translation: 'Good night',
          pronunciation: 'BWEH-nas NO-chehs',
          example: 'Buenas noches, mamá.',
          category: 'Common Phrases',
        ),
        WordModel(
          word: 'Sí',
          translation: 'Yes',
          pronunciation: 'SEE',
          example: 'Sí, quiero.',
          category: 'Common Phrases',
        ),
        WordModel(
          word: 'No',
          translation: 'No',
          pronunciation: 'NO',
          example: 'No, gracias.',
          category: 'Common Phrases',
        ),
        WordModel(
          word: 'Perdón',
          translation: 'Sorry / Excuse me',
          pronunciation: 'pehr-DOHN',
          example: 'Perdón, ¿dónde está el baño?',
          category: 'Common Phrases',
        ),
        WordModel(
          word: '¿Cómo estás?',
          translation: 'How are you?',
          pronunciation: 'KOH-moh ehs-TAHS',
          example: 'Hola, ¿cómo estás?',
          category: 'Common Phrases',
        ),
      ],
    ),
  ];
}