import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../base/text_to_speech.dart';
import '../../data/cards/models/card_model.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key, required this.card}) : super(key: key);

  final CardModel card;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final TextToSpeech tts = TextToSpeech(content: card.content);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 250,
        width: width,
        child: card.img == ''
            ? const Text('no image')
            : Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      await tts.speak();
                    },
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Image.asset(
                        card.img,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) {
                          return Image.network('src');
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      card.content,
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 15,
                        letterSpacing: 0.5,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
