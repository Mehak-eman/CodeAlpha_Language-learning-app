import 'package:flutter/material.dart';
import 'package:lingo_learn/screens/main_screen.dart';

import '../core/constants.dart';
import '../services/user_service.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState
    extends State<LanguageSelectionScreen> {
  int selectedIndex = 0;

  bool isSaving = false;

  final UserService _userService = UserService();

  Future<void> startLearning() async {
    final language = AppConstants.languages[selectedIndex];

    setState(() {
      isSaving = true;
    });

    try {
      // Save selected language to Firestore
      await _userService.saveLanguage(
        language['name']!,
      );

      if (!mounted) return;

      // Go to MainScreen and remove previous screens
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => MainScreen(
            language: language['name']!,
          ),
        ),
        (route) => false,
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to save language: $e',
          ),
        ),
      );

      setState(() {
        isSaving = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Language'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SizedBox(height: 20),

            const Text(
              'What do you want to learn?',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Select a language to start your learning journey.',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 30),

            Expanded(
              child: ListView.builder(
                itemCount: AppConstants.languages.length,

                itemBuilder: (context, index) {
                  final language =
                      AppConstants.languages[index];

                  final isSelected =
                      selectedIndex == index;

                  return GestureDetector(
                    onTap: isSaving
                        ? null
                        : () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },

                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 15,
                      ),

                      padding: const EdgeInsets.all(18),

                      decoration: BoxDecoration(
                        color: isSelected
                            ? Theme.of(context)
                                .colorScheme
                                .primary
                                .withValues(alpha: 0.1)
                            : Colors.white,

                        borderRadius:
                            BorderRadius.circular(16),

                        border: Border.all(
                          color: isSelected
                              ? Theme.of(context)
                                  .colorScheme
                                  .primary
                              : Colors.grey.shade200,

                          width: isSelected ? 2 : 1,
                        ),
                      ),

                      child: Row(
                        children: [
                          Text(
                            language['flag']!,
                            style: const TextStyle(
                              fontSize: 35,
                            ),
                          ),

                          const SizedBox(width: 18),

                          Expanded(
                            child: Text(
                              language['name']!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          if (isSelected)
                            Icon(
                              Icons.check_circle,
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary,
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed:
                    isSaving ? null : startLearning,

                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(14),
                  ),
                ),

                child: isSaving
                    ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : const Text(
                        'Start Learning',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}