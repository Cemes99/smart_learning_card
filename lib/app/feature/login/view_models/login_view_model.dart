
import 'package:get/get.dart';
import '../../../route/app_routes.dart';
import '../../../../global/global.dart';
import '../../../base/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  final RxString _username = RxString('');
  final RxString _password = RxString('');

  final RxnString _userErrorText = RxnString(null);
  final RxnString _passwordErrorText = RxnString(null);

  void onUsernameChange(String username) {
    _username.value = username;
  }

  void onPasswordChange(String password) {
    _password.value = password;
  }

  void _validateUsername(String username) {
    if (username.length < 5 || username.length > 25) {
      _userErrorText.value = 'Min Length: 5, Max Length: 25';
    } else if (_isFormatUsernameCorrect(username)) {
      _userErrorText.value = 'Username only numbers, characters';
    } else {
      _userErrorText.value = null;
    }
  }

  void _validatePassword(String password) {
    if (password.length < 5 || password.length > 25) {
      _passwordErrorText.value = 'Min Length: 5, Max Length: 25';
    } else if (_isFormatPasswordCorrect(password)) {
      _passwordErrorText.value = 'Password only numbers, characters';
    } else {
      _passwordErrorText.value = null;
    }
  }

  bool _isFormatUsernameCorrect(String username) {
    RegExp exp = RegExp(
      r'^(\w+)',
      multiLine: false,
      unicode: false,
    );

    String answer = exp.stringMatch(username) ?? '';
    return answer.length < username.length;
  }

  bool _isFormatPasswordCorrect(String password) {
    RegExp exp = RegExp(
      r'^(\w+)',
      multiLine: false,
      unicode: false,
    );

    String answer = exp.stringMatch(password) ?? '';
    return answer.length < password.length;
  }

  void toHome() {
    if(_userErrorText.value == null && _passwordErrorText.value == null) {
      global = true;
      Get.offAllNamed(Routes.home);
    }
  }

  void toRegister() {
    Get.toNamed(Routes.register);

  }
}