import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/word_model.dart';
import '../providers/progress_provider.dart';
import '../services/speech_service.dart';

class FlashcardScreen extends StatefulWidget {
  final List<WordModel> words;
  final String language;

  const FlashcardScreen({
    super.key,
    required this.words,
    required this.language,
  });

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  final SpeechService _speechService = SpeechService();

  int _currentIndex = 0;
  bool _showMeaning = false;

  WordModel get currentWord => widget.words[_currentIndex];

  @override
  void dispose() {
    _speechService.stop();
    super.dispose();
  }

  Future<void> _speakWord() async {
    await _speechService.speak(
      currentWord.word,
      language: widget.language,
    );
  }

  void _nextCard() {
    if (_currentIndex < widget.words.length - 1) {
      setState(() {
        _currentIndex++;
        _showMeaning = false;
      });
    } else {
      _completeFlashcards();
    }
  }

  void _previousCard() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _showMeaning = false;
      });
    }
  }

  Future<void> _completeFlashcards() async {
    await context.read<ProgressProvider>().completeLesson(
          widget.words.length,
        );

    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Great Job! 🎉'),
          content: Text(
            'You completed all ${widget.words.length} flashcards.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (widget.words.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Flashcards'),
        ),
        body: const Center(
          child: Text(
            'No flashcards available.',
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    }

    final progress =
        (_currentIndex + 1) / widget.words.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.language} Flashcards'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Progress information
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Card ${_currentIndex + 1} of ${widget.words.length}',
                    style: theme.textTheme.titleMedium,
                  ),
                  Text(
                    '${(progress * 100).round()}%',
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Progress bar
              LinearProgressIndicator(
                value: progress,
                minHeight: 8,
                borderRadius: BorderRadius.circular(10),
              ),

              const SizedBox(height: 30),

              // Flashcard
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _showMeaning = !_showMeaning;
                    });
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(25),
                        color: colorScheme.surface,
                      ),
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Icon(
                            _showMeaning
                                ? Icons.translate
                                : Icons.language,
                            size: 55,
                            color: colorScheme.primary,
                          ),

                          const SizedBox(height: 30),

                          Text(
                            _showMeaning
                                ? currentWord.translation
                                : currentWord.word,
                            textAlign: TextAlign.center,
                            style: theme
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 20),

                          if (!_showMeaning)
                            Text(
                              currentWord.pronunciation,
                              textAlign: TextAlign.center,
                              style: theme
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                color:
                                    colorScheme.onSurfaceVariant,
                              ),
                            ),

                          const SizedBox(height: 30),

                          Text(
                            _showMeaning
                                ? 'Tap to see the word'
                                : 'Tap to see the meaning',
                            style: theme
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                              color:
                                  colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Speaker button
              IconButton(
                onPressed: _speakWord,
                style: IconButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  padding: const EdgeInsets.all(18),
                ),
                icon: const Icon(
                  Icons.volume_up,
                  color: Colors.white,
                  size: 30,
                ),
              ),

              const SizedBox(height: 20),

              // Previous / Next buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _currentIndex > 0
                          ? _previousCard
                          : null,
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                      label: const Text('Previous'),
                      style: OutlinedButton.styleFrom(
                        padding:
                            const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _nextCard,
                      icon: Icon(
                        _currentIndex ==
                                widget.words.length - 1
                            ? Icons.check
                            : Icons.arrow_forward,
                      ),
                      label: Text(
                        _currentIndex ==
                                widget.words.length - 1
                            ? 'Finish'
                            : 'Next',
                      ),
                      style: ElevatedButton.styleFrom(
                        padding:
                            const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}