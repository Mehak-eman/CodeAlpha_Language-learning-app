import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../providers/progress_provider.dart';
import 'quiz_result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String language;

  const QuizScreen({
    super.key,
    required this.language,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 0;
  int selectedAnswer = -1;
  int correctAnswers = 0;

  bool answered = false;

  late List<Map<String, dynamic>> questions;

  @override
  void initState() {
    super.initState();

    questions = _getQuestions(widget.language);
  }

  List<Map<String, dynamic>> _getQuestions(String language) {
    switch (language) {
      case 'French':
        return [
          {
            'question': 'What does "Bonjour" mean?',
            'options': [
              'Hello',
              'Goodbye',
              'Thank you',
              'Please',
            ],
            'answer': 0,
          },
          {
            'question': 'What does "Merci" mean?',
            'options': [
              'Hello',
              'Thank you',
              'Good morning',
              'Goodbye',
            ],
            'answer': 1,
          },
          {
            'question': 'What does "Au revoir" mean?',
            'options': [
              'Please',
              'Hello',
              'Goodbye',
              'Thank you',
            ],
            'answer': 2,
          },
          {
            'question': 'What does "S’il vous plaît" mean?',
            'options': [
              'Please',
              'Goodbye',
              'Hello',
              'Good evening',
            ],
            'answer': 0,
          },
          {
            'question': 'What does "Bonsoir" mean?',
            'options': [
              'Good morning',
              'Good evening',
              'Thank you',
              'Please',
            ],
            'answer': 1,
          },
          {
            'question': 'Which French word means "Hello"?',
            'options': [
              'Merci',
              'Bonjour',
              'Bonsoir',
              'Au revoir',
            ],
            'answer': 1,
          },
          {
            'question': 'Which French phrase means "Thank you"?',
            'options': [
              'Merci',
              'Bonjour',
              'Au revoir',
              'S’il vous plaît',
            ],
            'answer': 0,
          },
          {
            'question': 'Which French phrase means "Goodbye"?',
            'options': [
              'Bonsoir',
              'Merci',
              'Au revoir',
              'Bonjour',
            ],
            'answer': 2,
          },
          {
            'question': 'Which French phrase means "Please"?',
            'options': [
              'Bonjour',
              'S’il vous plaît',
              'Merci',
              'Bonsoir',
            ],
            'answer': 1,
          },
          {
            'question': 'Which French word means "Good evening"?',
            'options': [
              'Bonjour',
              'Merci',
              'Bonsoir',
              'Au revoir',
            ],
            'answer': 2,
          },
        ];

      case 'English':
        return [
          {
            'question': 'What does "Hello" mean?',
            'options': [
              'Hello',
              'Goodbye',
              'Please',
              'Thank you',
            ],
            'answer': 0,
          },
          {
            'question': 'What does "Thank you" express?',
            'options': [
              'A greeting',
              'Gratitude',
              'A goodbye',
              'A question',
            ],
            'answer': 1,
          },
          {
            'question': 'What does "Goodbye" mean?',
            'options': [
              'Hello',
              'Thank you',
              'Goodbye',
              'Please',
            ],
            'answer': 2,
          },
          {
            'question': 'Which word is used to politely ask for something?',
            'options': [
              'Please',
              'Goodbye',
              'Hello',
              'Thank you',
            ],
            'answer': 0,
          },
          {
            'question': 'What does "Good morning" refer to?',
            'options': [
              'An evening greeting',
              'A morning greeting',
              'A goodbye',
              'A thank-you',
            ],
            'answer': 1,
          },
          {
            'question': 'Which word is a greeting?',
            'options': [
              'Hello',
              'Goodbye',
              'Please',
              'Thank you',
            ],
            'answer': 0,
          },
          {
            'question': 'Which phrase shows gratitude?',
            'options': [
              'Goodbye',
              'Hello',
              'Thank you',
              'Please',
            ],
            'answer': 2,
          },
          {
            'question': 'Which phrase is used when leaving?',
            'options': [
              'Hello',
              'Goodbye',
              'Good morning',
              'Please',
            ],
            'answer': 1,
          },
          {
            'question': 'Which word is commonly used when making a polite request?',
            'options': [
              'Thank you',
              'Goodbye',
              'Please',
              'Hello',
            ],
            'answer': 2,
          },
          {
            'question': 'Which phrase is a morning greeting?',
            'options': [
              'Goodbye',
              'Thank you',
              'Good morning',
              'Please',
            ],
            'answer': 2,
          },
        ];

      case 'Spanish':
      default:
        return [
          {
            'question': 'What does "Hola" mean?',
            'options': [
              'Hello',
              'Goodbye',
              'Thank you',
              'Please',
            ],
            'answer': 0,
          },
          {
            'question': 'What does "Gracias" mean?',
            'options': [
              'Hello',
              'Thank you',
              'Goodbye',
              'Please',
            ],
            'answer': 1,
          },
          {
            'question': 'What does "Adiós" mean?',
            'options': [
              'Good morning',
              'Thank you',
              'Goodbye',
              'Hello',
            ],
            'answer': 2,
          },
          {
            'question': 'What does "Por favor" mean?',
            'options': [
              'Please',
              'Hello',
              'Goodbye',
              'Thank you',
            ],
            'answer': 0,
          },
          {
            'question': 'What does "Buenos días" mean?',
            'options': [
              'Goodbye',
              'Good morning',
              'Thank you',
              'Please',
            ],
            'answer': 1,
          },
          {
            'question': 'Which Spanish word means "Hello"?',
            'options': [
              'Gracias',
              'Adiós',
              'Hola',
              'Por favor',
            ],
            'answer': 2,
          },
          {
            'question': 'Which Spanish word means "Thank you"?',
            'options': [
              'Gracias',
              'Hola',
              'Adiós',
              'Buenos días',
            ],
            'answer': 0,
          },
          {
            'question': 'Which Spanish word means "Goodbye"?',
            'options': [
              'Hola',
              'Por favor',
              'Adiós',
              'Gracias',
            ],
            'answer': 2,
          },
          {
            'question': 'Which Spanish phrase means "Please"?',
            'options': [
              'Buenos días',
              'Gracias',
              'Hola',
              'Por favor',
            ],
            'answer': 3,
          },
          {
            'question': 'Which Spanish phrase means "Good morning"?',
            'options': [
              'Adiós',
              'Buenos días',
              'Gracias',
              'Hola',
            ],
            'answer': 1,
          },
        ];
    }
  }

  void selectAnswer(int index) {
    if (answered) return;

    setState(() {
      selectedAnswer = index;
      answered = true;

      if (index == questions[currentQuestion]['answer']) {
        correctAnswers++;
      }
    });
  }

  Future<void> nextQuestion() async {
    if (!answered) return;

    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
        selectedAnswer = -1;
        answered = false;
      });
    } else {
      await _finishQuiz();
    }
  }

  Future<void> _finishQuiz() async {
    await context.read<ProgressProvider>().completeQuiz(
          totalQuestions: questions.length,
          correctAnswers: correctAnswers,
        );

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => QuizResultScreen(
          score: correctAnswers,
          totalQuestions: questions.length,
          language: widget.language,
        ),
      ),
    );
  }

  Color _optionColor(int index) {
    if (!answered) {
      return Theme.of(context).colorScheme.surface;
    }

    final correctAnswer = questions[currentQuestion]['answer'];

    if (index == correctAnswer) {
      return Colors.green.shade100;
    }

    if (index == selectedAnswer && index != correctAnswer) {
      return Colors.red.shade100;
    }

    return Theme.of(context).colorScheme.surface;
  }

  Color _optionBorderColor(int index) {
    if (!answered) {
      return Colors.grey.shade300;
    }

    final correctAnswer = questions[currentQuestion]['answer'];

    if (index == correctAnswer) {
      return Colors.green;
    }

    if (index == selectedAnswer && index != correctAnswer) {
      return Colors.red;
    }

    return Colors.grey.shade300;
  }

  IconData? _optionIcon(int index) {
    if (!answered) return null;

    final correctAnswer = questions[currentQuestion]['answer'];

    if (index == correctAnswer) {
      return Icons.check_circle;
    }

    if (index == selectedAnswer && index != correctAnswer) {
      return Icons.cancel;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return const Scaffold(
        body: Center(
          child: Text('No quiz questions available.'),
        ),
      );
    }

    final question = questions[currentQuestion];

    final String questionText =
        question['question'].toString();

    final List<String> options =
        List<String>.from(question['options']);

    final int correctAnswer =
        question['answer'] as int;

    final double progress =
        (currentQuestion + 1) / questions.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.language} Quiz',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Question counter
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Question ${currentQuestion + 1}',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    '${currentQuestion + 1}/${questions.length}',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Progress bar
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 8,
                ),
              ),

              const SizedBox(height: 30),

              // Question card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer,
                ),

                child: Column(
                  children: [
                    const Icon(
                      Icons.quiz_rounded,
                      size: 45,
                    ),

                    const SizedBox(height: 15),

                    Text(
                      questionText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Choose the correct answer:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 12),

              // Options
              Expanded(
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final icon = _optionIcon(index);

                    return GestureDetector(
                      onTap: () => selectAnswer(index),

                      child: AnimatedContainer(
                        duration:
                            const Duration(milliseconds: 200),

                        margin: const EdgeInsets.only(
                          bottom: 12,
                        ),

                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 17,
                        ),

                        decoration: BoxDecoration(
                          color: _optionColor(index),
                          borderRadius:
                              BorderRadius.circular(16),
                          border: Border.all(
                            color: _optionBorderColor(index),
                            width: 1.5,
                          ),
                        ),

                        child: Row(
                          children: [
                            // A/B/C/D
                            Container(
                              width: 38,
                              height: 38,

                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                              ),

                              alignment: Alignment.center,

                              child: Text(
                                String.fromCharCode(
                                  65 + index,
                                ),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            const SizedBox(width: 14),

                            Expanded(
                              child: Text(
                                options[index],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),

                            if (icon != null)
                              Icon(
                                icon,
                                color: index == correctAnswer
                                    ? Colors.green
                                    : Colors.red,
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Next button
              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  onPressed:
                      answered ? nextQuestion : null,

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(16),
                    ),
                  ),

                  child: Text(
                    currentQuestion ==
                            questions.length - 1
                        ? 'Finish Quiz'
                        : 'Next Question',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}