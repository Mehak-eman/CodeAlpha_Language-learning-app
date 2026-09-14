import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/user_service.dart';
import 'language_selection_screen.dart';
import 'login_screen.dart';
import 'main_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, authSnapshot) {
        // Firebase is checking login status
        if (authSnapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final user = authSnapshot.data;

        // User is not logged in
        if (user == null) {
          return const LoginScreen();
        }

        // User is logged in
        return FutureBuilder<Map<String, dynamic>?>(
          future: _loadUserProfile(),
          builder: (context, profileSnapshot) {
            if (profileSnapshot.connectionState ==
                ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (profileSnapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 60,
                        ),
                        const SizedBox(height: 20),

                        const Text(
                          'Unable to load your profile.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          '${profileSnapshot.error}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.red,
                          ),
                        ),

                        const SizedBox(height: 25),

                        ElevatedButton(
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();
                          },
                          child: const Text('Back to Login'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }

            final profile = profileSnapshot.data;

            // Profile doesn't exist yet
            if (profile == null) {
              return const LanguageSelectionScreen();
            }

            final setupCompleted =
                profile['setupCompleted'] == true;

            // User has not selected a language yet
            if (!setupCompleted) {
              return const LanguageSelectionScreen();
            }

            final savedLanguage =
                profile['language'] as String?;

            final language =
                savedLanguage != null &&
                        savedLanguage.isNotEmpty
                    ? savedLanguage
                    : 'Spanish';

            // Everything is ready
            return MainScreen(
              language: language,
            );
          },
        );
      },
    );
  }

  Future<Map<String, dynamic>?> _loadUserProfile() async {
    final userService = UserService();

    final profile = await userService.getProfile();

    // If profile doesn't exist, create it.
    if (profile == null) {
      await userService.createInitialProfile();
      return await userService.getProfile();
    }

    return profile;
  }
}