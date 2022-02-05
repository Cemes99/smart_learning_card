
import 'package:get/get.dart';
import 'package:smart_learning_card/app/base/base_view_model.dart';
import 'package:smart_learning_card/app/base/constant.dart';
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

  RegisterState result = RegisterState.succeed;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    debounce(
      _username,
      onUsernameChange,
      time: const Duration(microseconds: 1000),
    );

    debounce(
      _password,
      onPasswordChange,
      time: const Duration(microseconds: 1000),
    );

    debounce(
      _repeatPassword,
      onRepeatPasswordChange,
      time: const Duration(microseconds: 1000),
    );
  }

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
      result = RegisterState.invalidLengthUsername;
    } else if (_isFormatUsernameCorrect(username)) {
      result = RegisterState.invalidFormatUsername;
    }
  }

  void _validatePassword(String password) {
    if (password.length < 6 || password.length > 18) {
      result = RegisterState.invalidLengthPassword;
    } else if (_isFormatPasswordCorrect(password)) {
      result = RegisterState.invalidFormatPassword;
    }
  }

  void _validateRepeatPassword(String password) {
    if (password.length < 6 || password.length > 18) {
      result = RegisterState.invalidLengthRepeatPassword;
    } else if (_isFormatPasswordCorrect(password)) {
      result = RegisterState.invalidFormatRepeatPassword;
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

  Future<bool> submit() async {
    result = RegisterState.succeed;
    
    _validateUsername(_username.value);
    if (result != RegisterState.succeed) return false;
    _validatePassword(_password.value);
    if (result != RegisterState.succeed) return false;
    _validateRepeatPassword(_repeatPassword.value);
    if (result != RegisterState.succeed) return false;

    if(_password.value != _repeatPassword.value) {
      result = RegisterState.differPassword;
      return false;
    }
    
    result = await UserService().register(_username.value, _password.value);
    if (result != RegisterState.succeed) return false;

    return true;
  }

  void toHome() {
    if (result == RegisterState.succeed) {
      global = true;
      Get.offAllNamed(Routes.home);
    }
  }

  void toLogin() {
    Get.offNamed(Routes.login);
  }
  
  String submitResult() {
    switch (result) {
      case RegisterState.invalidLengthUsername: return 'Tài khoản có độ dài 6 - 18';
      case RegisterState.invalidFormatUsername: return 'Tài khoản chỉ chứa ký tự, số, dấu gạch dưới';
      case RegisterState.invalidLengthPassword: return 'Mật khẩu có độ dài 6 - 18';
      case RegisterState.invalidFormatPassword: return 'Mật khẩu chỉ chứa ký tự, số, dấu gạch dưới';
      case RegisterState.invalidLengthRepeatPassword: return 'Mật khẩu có độ dài 6 - 18';
      case RegisterState.invalidFormatRepeatPassword: return 'Mật khẩu chỉ chứa ký tự, số, dấu gạch dưới';
      case RegisterState.differPassword: return 'Hai mật khẩu cần giống nhau';
      case RegisterState.existedUser: return 'Tài khoản đã tồn tại';
      default: return 'Đăng ký thành công';
    }
  }
}