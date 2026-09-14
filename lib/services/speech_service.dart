import 'package:flutter_tts/flutter_tts.dart';

class SpeechService {
  final FlutterTts _flutterTts = FlutterTts();

  Future<void> speak(String text, {required String language}) async {
    await _flutterTts.stop();

    await _flutterTts.setLanguage('es-ES');
    await _flutterTts.setSpeechRate(0.45);

    await _flutterTts.speak(text);
  }

  Future<void> stop() async {
    await _flutterTts.stop();
  }
}