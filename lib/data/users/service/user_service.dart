
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';
import '../../../app/base/constant.dart';

class UserService {
  static const String _path = 'users';
  final CollectionReference users =
      FirebaseFirestore.instance.collection(_path);

  Future<LoginState> signIn(String username, String password) async {
    QuerySnapshot querySnapshot = await users.get();
    for (var value in querySnapshot.docs) {
      DocumentSnapshot temp = await users.doc(value.id).get();
      if (temp['username'] == username) {
        if (temp['password'] != password) return LoginState.wrongPassword;

        return LoginState.succeed;
      }
    }

    return LoginState.noUser;
  }

  Future<RegisterState> register(String username, String password) async {
    QuerySnapshot querySnapshot = await users.get();
    for (var value in querySnapshot.docs) {
      DocumentSnapshot temp = await users.doc(value.id).get();
      if (temp['username'] == username) return RegisterState.existedUser;
    }

    dynamic err;

    users.add({
      'username': username,
      'name': '',
      'password': password,
      'listTopicDetails': [],
    }).catchError((error) => err = error);
    if (err != null) return RegisterState.bug;

    return RegisterState.succeed;
  }

  Future<UserModel> profileDetails(String username) async {
    QuerySnapshot querySnapshot = await users.get();
    for (var value in querySnapshot.docs) {
      DocumentSnapshot temp = await users.doc(value.id).get();
      if (temp['username'] == username) {
        return UserModel(
          username: username,
          password: temp['password'],
          name: temp['name'],
        );
      }
    }

    return UserModel(username: '', password: '', name: '');
  }
}
