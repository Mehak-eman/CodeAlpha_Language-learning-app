import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  DocumentReference<Map<String, dynamic>>? get _profileDocument {
    final uid = _auth.currentUser?.uid;

    if (uid == null) {
      return null;
    }

    return _firestore
        .collection('users')
        .doc(uid)
        .collection('profile')
        .doc('data');
  }

  // Create profile for a newly registered user
  Future<void> createInitialProfile() async {
    final user = _auth.currentUser;
    final document = _profileDocument;

    if (user == null || document == null) {
      return;
    }

    await document.set(
      {
        'email': user.email ?? '',
        'language': '',
        'setupCompleted': false,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      },
      SetOptions(merge: true),
    );
  }

  // Save selected language
  Future<void> saveLanguage(String language) async {
    final document = _profileDocument;

    if (document == null) {
      return;
    }

    await document.set(
      {
        'language': language,
        'setupCompleted': true,
        'updatedAt': FieldValue.serverTimestamp(),
      },
      SetOptions(merge: true),
    );
  }

  // Get user's profile
  Future<Map<String, dynamic>?> getProfile() async {
    final document = _profileDocument;

    if (document == null) {
      return null;
    }

    final snapshot = await document.get();

    if (!snapshot.exists) {
      return null;
    }

    return snapshot.data();
  }
}