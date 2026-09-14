import 'package:flutter/material.dart';

class QuizResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const QuizResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions, required String language,
  });

  @override
  Widget build(BuildContext context) {
    final percentage =
        ((score / totalQuestions) * 100).round();

    String message;

    if (percentage >= 80) {
      message = 'Excellent work! 🎉';
    } else if (percentage >= 60) {
      message = 'Good job! Keep practicing! 👍';
    } else {
      message = 'Keep practicing. You can do it! 💪';
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Quiz Result'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [
            Container(
              height: 110,
              width: 110,

              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .primary
                    .withValues(alpha: 0.1),

                shape: BoxShape.circle,
              ),

              child: Icon(
                percentage >= 60
                    ? Icons.emoji_events
                    : Icons.menu_book,
                size: 55,
                color: Theme.of(context)
                    .colorScheme
                    .primary,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Quiz Complete!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),

            const SizedBox(height: 35),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(20),

                border: Border.all(
                  color: Colors.grey.shade200,
                ),
              ),

              child: Column(
                children: [
                  Text(
                    '$percentage%',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context)
                          .colorScheme
                          .primary,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    '$score / $totalQuestions correct',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },

                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(
                    vertical: 17,
                  ),

                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                ),

                child: const Text(
                  'Back to Quiz',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,

              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },

                style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(
                    vertical: 17,
                  ),

                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                ),

                child: const Text(
                  'Continue Learning',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}