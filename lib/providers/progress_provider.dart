import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class ProgressProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  int wordsLearned = 0;
  int lessonsCompleted = 0;
  int quizzesCompleted = 0;
  int totalQuizQuestions = 0;
  int correctQuizAnswers = 0;
  int streak = 0;

  bool isLoading = true;

  double get learningProgress {
    return (wordsLearned / 100).clamp(0.0, 1.0);
  }

  double get quizAccuracy {
    if (totalQuizQuestions == 0) {
      return 0;
    }

    return correctQuizAnswers / totalQuizQuestions;
  }

  /// Returns the current user's Firestore progress document.
  DocumentReference<Map<String, dynamic>>? get _progressDocument {
    final user = _auth.currentUser;

    if (user == null) {
      return null;
    }

    return _firestore
        .collection('users')
        .doc(user.uid)
        .collection('progress')
        .doc('stats');
  }

  /// Load progress from Firestore.
  Future<void> loadProgress() async {
    isLoading = true;
    notifyListeners();

    final document = _progressDocument;

    if (document == null) {
      isLoading = false;
      notifyListeners();
      return;
    }

    try {
      final snapshot = await document.get();

      if (snapshot.exists) {
        final data = snapshot.data()!;

        wordsLearned = data['wordsLearned'] ?? 0;
        lessonsCompleted = data['lessonsCompleted'] ?? 0;
        quizzesCompleted = data['quizzesCompleted'] ?? 0;
        totalQuizQuestions = data['totalQuizQuestions'] ?? 0;
        correctQuizAnswers = data['correctQuizAnswers'] ?? 0;
        streak = data['streak'] ?? 0;
      }
    } catch (e) {
      debugPrint('Error loading progress: $e');
    }

    isLoading = false;
    notifyListeners();
  }

  /// Called when a lesson is completed.
  Future<void> completeLesson(int words) async {
    wordsLearned += words;
    lessonsCompleted++;

    if (streak == 0) {
      streak = 1;
    }

    await _saveProgress();

    notifyListeners();
  }

  /// Called when a quiz is completed.
  Future<void> completeQuiz({
    required int totalQuestions,
    required int correctAnswers,
  }) async {
    quizzesCompleted++;

    totalQuizQuestions += totalQuestions;
    correctQuizAnswers += correctAnswers;

    await _saveProgress();

    notifyListeners();
  }

  /// Save progress to Firestore.
  Future<void> _saveProgress() async {
    final document = _progressDocument;

    if (document == null) {
      return;
    }

    try {
      await document.set(
        {
          'wordsLearned': wordsLearned,
          'lessonsCompleted': lessonsCompleted,
          'quizzesCompleted': quizzesCompleted,
          'totalQuizQuestions': totalQuizQuestions,
          'correctQuizAnswers': correctQuizAnswers,
          'streak': streak,
          'updatedAt': FieldValue.serverTimestamp(),
        },
        SetOptions(merge: true),
      );
    } catch (e) {
      debugPrint('Error saving progress: $e');
    }
  }

  /// Reset the current user's progress.
  Future<void> resetProgress() async {
    final document = _progressDocument;

    if (document == null) {
      return;
    }

    try {
      await document.delete();

      wordsLearned = 0;
      lessonsCompleted = 0;
      quizzesCompleted = 0;
      totalQuizQuestions = 0;
      correctQuizAnswers = 0;
      streak = 0;

      notifyListeners();
    } catch (e) {
      debugPrint('Error resetting progress: $e');
    }
  }
}