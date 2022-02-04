
import 'package:get/get.dart';
import 'package:smart_learning_card/app/base/base_view_model.dart';
import 'package:smart_learning_card/app/route/app_routes.dart';
import 'package:smart_learning_card/data/users/service/user_service.dart';
import 'package:smart_learning_card/global/global.dart';

class RegisterViewModel extends BaseViewModel {
  final String title = 'Đăng ký';
  final String hintUsername = 'Tên tài khoản';
  final String hintPassword = 'Mật khẩu';
  final String hintRepeatPassword = 'Nhập lại mật khẩu';

  final RxString _username = RxString('');
  final RxString _password = RxString('');
  final RxString _repeatPassword = RxString('');

  final RxnString _userErrorText = RxnString(null);
  final RxnString _passwordErrorText = RxnString(null);
  final RxnString _repeatPasswordErrorText = RxnString(null);

  final RxString submitResult = RxString('Đăng nhập thành công');

  // final RxnString
  void onUsernameChange(String username) {
    _username.value = username;
  }

  void onPasswordChange(String password) {
    _password.value = password;
  }

  void onRepeatPasswordChange(String password) {
    _repeatPassword.value = password;
  }

  void _validateUsername(String username) {
    if (username.length < 5 || username.length > 25) {
      _userErrorText.value = 'Tài khoản có độ dài 6 - 18 ký tự';
      return;
    }
    if (_isFormatUsernameCorrect(username)) {
      _userErrorText.value =
      'Tài khoản chỉ gồm các ký tự số, chữ cái, dấu gạch dưới';
      return;
    }
    _userErrorText.value = null;
  }

  void _validatePassword(String password) {
    if (password.length < 6 || password.length > 18) {
      _passwordErrorText.value = 'Mật khẩu có độ dài 6 - 18 ký tự';
      return;
    }
    if (_isFormatPasswordCorrect(password)) {
      _passwordErrorText.value =
      'Mật khẩu chỉ gồm các ký tự số, chữ cái, dấu gạch dưới';
      return;
    }
    _passwordErrorText.value = null;
  }

  void _validateRepeatPassword(String password) {
    if (password.length < 6 || password.length > 18) {
      _repeatPasswordErrorText.value = 'Mật khẩu có độ dài 6 - 18 ký tự';
      return;
    }
    if (_isFormatPasswordCorrect(password)) {
      _repeatPasswordErrorText.value =
      'Mật khẩu chỉ gồm các ký tự số, chữ cái, dấu gạch dưới';
      return;
    }
    _repeatPasswordErrorText.value = null;
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

  Future<bool> submit() async {
    // print(_username);
    // print(_password);

    _validateUsername(_username.value);
    if (_userErrorText.value != null) {
      submitResult.value = _userErrorText.value!;
      return false;
    }
    _validatePassword(_password.value);
    if (_passwordErrorText.value != null) {
      submitResult.value = _passwordErrorText.value!;
      return false;
    }

    String result = await UserService().signIn(_username.value, _password.value);
    submitResult.value = result;
    if (result != 'Đăng ký thành công') return false;

    return true;
  }

  void toHome() {
    if (submitResult.value == 'Đăng nhập thành công') {
      global = true;
      Get.offAllNamed(Routes.home);
    }
  }

  void toRegister() {
    Get.toNamed(Routes.register);
  }

  void callDialog() {}
}