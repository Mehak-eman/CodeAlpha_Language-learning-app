import '../models/quiz_model.dart';

class SampleQuizzes {
  static const List<QuizQuestion> spanishQuiz = [
    QuizQuestion(
      question: 'What does "Hola" mean?',
      options: [
        'Goodbye',
        'Hello',
        'Thank you',
        'Please',
      ],
      correctAnswer: 'Hello',
    ),

    QuizQuestion(
      question: 'What does "Gracias" mean?',
      options: [
        'Sorry',
        'Hello',
        'Thank you',
        'Good night',
      ],
      correctAnswer: 'Thank you',
    ),

    QuizQuestion(
      question: 'What does "Adiós" mean?',
      options: [
        'Goodbye',
        'Please',
        'Yes',
        'Good morning',
      ],
      correctAnswer: 'Goodbye',
    ),

    QuizQuestion(
      question: 'What does "Por favor" mean?',
      options: [
        'No',
        'Please',
        'Thank you',
        'Sorry',
      ],
      correctAnswer: 'Please',
    ),

    QuizQuestion(
      question: 'What does "Buenos días" mean?',
      options: [
        'Good night',
        'Goodbye',
        'Good morning',
        'Hello',
      ],
      correctAnswer: 'Good morning',
    ),

    QuizQuestion(
      question: 'What does "Buenas noches" mean?',
      options: [
        'Good night',
        'Good morning',
        'Thank you',
        'Yes',
      ],
      correctAnswer: 'Good night',
    ),

    QuizQuestion(
      question: 'What does "Sí" mean?',
      options: [
        'No',
        'Yes',
        'Please',
        'Sorry',
      ],
      correctAnswer: 'Yes',
    ),

    QuizQuestion(
      question: 'What does "No" mean?',
      options: [
        'Yes',
        'Hello',
        'No',
        'Goodbye',
      ],
      correctAnswer: 'No',
    ),

    QuizQuestion(
      question: 'What does "Perdón" mean?',
      options: [
        'Sorry / Excuse me',
        'Thank you',
        'Good morning',
        'Please',
      ],
      correctAnswer: 'Sorry / Excuse me',
    ),

    QuizQuestion(
      question: 'What does "¿Cómo estás?" mean?',
      options: [
        'Where are you?',
        'How are you?',
        'What is your name?',
        'Goodbye',
      ],
      correctAnswer: 'How are you?',
    ),
  ];
}