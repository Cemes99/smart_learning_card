import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/test_model.dart';
import '../../../global/global.dart';

class TestService {
  static const String _path = 'test_details';
  final CollectionReference tests =
      FirebaseFirestore.instance.collection(_path);

  void submitTest(String username, String topic, List<String> question,
      List<bool> answer, String score, DateTime time) {
    tests.add({
      'user': username,
      'topic': topic,
      'question': question,
      'answer': answer,
      'score': score,
      'time': Timestamp.fromDate(time),
    });
  }

  Future<List<TestModel>> getTestResult() async {
    List<TestModel> list = [];
    QuerySnapshot querySnapshot = await tests.orderBy("time", descending: false).get();


    for (var value in querySnapshot.docs) {
      DocumentSnapshot temp = await tests.doc(value.id).get();
      if (temp['user'] == user) {
        Timestamp time = temp['time'];
        DateTime dateTime = time.toDate();

        list.add(TestModel(
          user: temp['user'],
          topic: temp['topic'],
          question: temp['question'],
          answer: temp['answer'],
          score: temp['score'],
          dateTime: dateTime,
        ));
      }
    }

    return list;
  }
}
