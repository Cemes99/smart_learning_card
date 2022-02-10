import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/card_model.dart';

class TopicService {
  static const String _pathTopic = 'topics';
  static const String _pathCard = 'cards';

  final CollectionReference topics =
      FirebaseFirestore.instance.collection(_pathTopic);
  final CollectionReference cards =
      FirebaseFirestore.instance.collection(_pathCard);

  Future<List<CardModel>> getCard(String name) async {
    QuerySnapshot querySnapshotTopic = await topics.get();
    List<String> listCard = [];
    for (var value in querySnapshotTopic.docs) {
      DocumentSnapshot temp = await topics.doc(value.id).get();
      if (temp['name'] == name) {
        for (String x in temp['listCard']) {
          listCard.add(x);
        }

        break;
      }
    }

    QuerySnapshot querySnapshotCard = await cards.get();
    List<CardModel> list = [];

    for (String x in listCard) {
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

  Future<void> submit(String user, List<String> question, List<bool> answer) async {

  }
}
