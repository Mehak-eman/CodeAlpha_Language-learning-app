import 'word_model.dart';

class LessonModel {
  final String id;
  final String title;
  final String category;
  final String description;
  final List<WordModel> words;

  const LessonModel({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.words,
  });
}