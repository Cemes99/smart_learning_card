
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/card_model.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key, required this.card}) : super(key: key);

  final CardModel card;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final TTS tts = TTS(content: card.content);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 200,
        width: width,
        child: card.img == '' ? const Text('no image') :
        Column(
          children: [
            GestureDetector(
              onTap: () {
                tts.speak();
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Image.asset(
                  card.img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Center(
              child: Text(
                card.content,
                style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 15,
                  letterSpacing: 0.5,
                  decoration: TextDecoration.none
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TTS {
  final FlutterTts tts = FlutterTts();
  late final String content;
  TTS({required this.content});

  Future speak() async {
    /*
    * vi-VN
    * en-US
    * */
    // print(await tts.getLanguages);
    await tts.setLanguage('vi-VN');
    await tts.setSpeechRate(0.45);
    await tts.setPitch(0.9);
    await tts.speak(content);
  }
}
