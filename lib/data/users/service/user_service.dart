import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

class UserService {
  final DatabaseReference _database =
      FirebaseDatabase.instance.ref('/list_user');

  Future<String> signIn(String username, String password) async {
    String result = 'Đăng nhập thành công';
    StreamSubscription stream = _database.child('/$username').onValue.listen(
      (event) {
        if (event.snapshot.value == null) {
          result = 'Tài khoản không tồn tại';
        } else {
          for (var x in event.snapshot.children) {
            if (x.key == 'password' && password != x.value) {
              result = 'Mật khẩu không chính xác';
            }
          }
        }
      },
    );

    await Future.delayed(const Duration(microseconds: 2000));
    print(result + '---');
    return result;
  }

  String register(String username, String password) {
    String result = 'Đăng ký thành công';
    _database.child('/$username').onValue.listen((event) {
      if (event.snapshot.value != null) {
        result = 'Tài khoản đã tồn tại';
        return;
      }
    });

    return result;
  }
}
