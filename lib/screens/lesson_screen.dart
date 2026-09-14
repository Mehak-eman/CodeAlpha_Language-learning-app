import 'package:flutter/material.dart';

import '../models/lesson_model.dart';
import 'flashcard_screen.dart';

class LessonScreen extends StatelessWidget {
  final LessonModel lesson;
  final String language;

  const LessonScreen({
    super.key,
    required this.lesson,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Lesson Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '📚 Daily Lesson',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    lesson.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    lesson.description,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Section Title
            const Text(
              'Lesson Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // Words
            _InfoRow(
              icon: Icons.menu_book,
              title: 'Words',
              value: '${lesson.words.length}',
            ),

            const SizedBox(height: 12),

            // Category
            _InfoRow(
              icon: Icons.category,
              title: 'Category',
              value: lesson.category,
            ),

            const SizedBox(height: 12),

            // Estimated Time
            const _InfoRow(
              icon: Icons.timer,
              title: 'Estimated Time',
              value: '5 minutes',
            ),

            const SizedBox(height: 12),

            // Language
            _InfoRow(
              icon: Icons.language,
              title: 'Language',
              value: language,
            ),

            const Spacer(),

            // Start Lesson Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FlashcardScreen(
  words: lesson.words,
  language: language,
)
                    ),
                  );
                },
                icon: const Icon(
                  Icons.play_arrow,
                ),
                label: const Text(
                  'Start Lesson',
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 17,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: colorScheme.primary,
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}