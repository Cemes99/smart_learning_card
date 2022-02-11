
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/card_model.dart';

class CardService {
  static const String _path = 'cards';
  final CollectionReference cards =
    FirebaseFirestore.instance.collection(_path);

  Future<List<CardModel>> getCards(List<String> listId) async {
    QuerySnapshot querySnapshotCard = await cards.get();
    List<CardModel> list = [];

    for (String x in listId) {
      for (var value in querySnapshotCard.docs) {
        if (value.id == x) {
          DocumentSnapshot temp = await cards.doc(x).get();
          list.add(
            CardModel(
              id: x,
              content: temp['content'],
              img: temp['img'],
            ),
          );
        }
      }
    }

    return list;
  }
}