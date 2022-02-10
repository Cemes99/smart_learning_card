import 'package:cloud_firestore/cloud_firestore.dart';

class TestService {
  static const String _path = 'test_details';
  final CollectionReference tests =
      FirebaseFirestore.instance.collection(_path);

  void submitTest(String username, List<String> question, List<bool> answer) {
    print('submit test');
    var err;
    tests.add({
      'user': username,
      'question': question,
      'answer': answer,
    }).catchError((error) => err = error);

    if(err != null) print(err);
  }
}
