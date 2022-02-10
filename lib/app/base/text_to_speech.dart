
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech {
  final FlutterTts tts = FlutterTts();
  final String content;

  TextToSpeech({required this.content});

  Future speak() async {
    // vi-VN
    // en-US
    // print(await tts.getLanguages);
    await tts.setLanguage('vi-VN');
    await tts.setSpeechRate(0.45);
    await tts.setPitch(0.9);
    await tts.speak(content);
  }
}