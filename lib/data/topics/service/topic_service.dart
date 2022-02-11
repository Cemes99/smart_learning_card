
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../cards/service/card_service.dart';
import '../../cards/models/card_model.dart';

class TopicService {
  static const String _pathTopic = 'topics';
  static const String _pathCard = 'cards';

  final CollectionReference topics =
      FirebaseFirestore.instance.collection(_pathTopic);
  final CollectionReference cards =
      FirebaseFirestore.instance.collection(_pathCard);

  Future<List<CardModel>> getCards(String name) async {
    QuerySnapshot querySnapshotTopic = await topics.get();
    List<String> listId = [];
    for (var value in querySnapshotTopic.docs) {
      DocumentSnapshot temp = await topics.doc(value.id).get();
      if (temp['name'] == name) {
        for (String x in temp['listCard']) {
          listId.add(x);
        }

        break;
      }
    }

    return await CardService().getCards(listId);
  }
}
