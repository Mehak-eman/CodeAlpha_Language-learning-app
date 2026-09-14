import 'package:flutter/material.dart';

import '../data/language_data.dart';
import '../services/speech_service.dart';

class LearnScreen extends StatefulWidget {
  final String language;

  const LearnScreen({
    super.key,
    required this.language,
  });

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  final SpeechService _speechService = SpeechService();

  int? speakingIndex;

  @override
  Widget build(BuildContext context) {
    final languageData = LanguageData.getLanguage(widget.language);

    final words = List<Map<String, dynamic>>.from(
      languageData['words'] ?? [],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.language} Lessons',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: words.isEmpty
          ? const Center(
              child: Text(
                'No lessons available.',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.menu_book_rounded,
                        size: 40,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        languageData['lessonTitle'] ??
                            'Basic ${widget.language} Phrases',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Learn ${words.length} useful words and phrases.',
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Vocabulary',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                ...List.generate(
                  words.length,
                  (index) {
                    final word = words[index];

                    final String original =
                        word['word']?.toString() ?? '';

                    final String meaning =
                        word['meaning']?.toString() ?? '';

                    final String pronunciation =
                        word['pronunciation']?.toString() ?? '';

                    final bool isSpeaking =
                        speakingIndex == index;

                    return Card(
                      margin: const EdgeInsets.only(bottom: 14),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),

                            const SizedBox(width: 14),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    original,
                                    style: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    meaning,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                  if (pronunciation.isNotEmpty) ...[
                                    const SizedBox(height: 5),
                                    Text(
                                      pronunciation,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),

                            IconButton(
                              tooltip: 'Listen',
                              onPressed: () async {
                                setState(() {
                                  speakingIndex = index;
                                });

                                try {
                                  await _speechService.speak(
                                    original,
                                    language: widget.language,
                                  );
                                } finally {
                                  if (mounted) {
                                    setState(() {
                                      speakingIndex = null;
                                    });
                                  }
                                }
                              },
                              icon: Icon(
                                isSpeaking
                                    ? Icons.volume_up
                                    : Icons.volume_up_outlined,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Theme.of(context)
                        .colorScheme
                        .surfaceContainerHighest,
                  ),
                  child: const Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.lightbulb_outline),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Learning Tip',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Practice a few words every day to improve your memory and pronunciation',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
    );
  }
}