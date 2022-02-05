import 'package:get/get.dart';
import 'package:smart_learning_card/app/base/constant.dart';
import 'package:smart_learning_card/data/users/service/user_service.dart';
import '../../../route/app_routes.dart';
import '../../../../global/global.dart';
import '../../../base/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  final String title = 'Đăng nhập';
  final String hintTextUsername = 'Tài khoản';
  final String hintTextPassword = 'Mật khẩu';

  final RxString _username = RxString('');
  final RxString _password = RxString('');

  LoginState result = LoginState.succeed;

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
  }

  void onUsernameChange(String username) {
    _username.value = username;
  }

  void onPasswordChange(String password) {
    _password.value = password;
  }

  void _validateUsername(String username) {
    if (username.length < 5 || username.length > 25) {
      result = LoginState.invalidLengthUsername;
    } else if (_isFormatUsernameCorrect(username)) {
      result = LoginState.invalidFormatUsername;
    }
  }

  void _validatePassword(String password) {
    if (password.length < 6 || password.length > 18) {
      result = LoginState.invalidLengthPassword;
    } else if (_isFormatPasswordCorrect(password)) {
      result = LoginState.invalidFormatPassword;
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
    result = LoginState.succeed;

    _validateUsername(_username.value);
    if(result != LoginState.succeed) return false;
    _validatePassword(_password.value);
    if(result != LoginState.succeed) return false;

    result = await UserService().signIn(_username.value, _password.value);
    if (result != LoginState.succeed) return false;

    return true;
  }

  void toHome() {
    if (result == LoginState.succeed) {
      global = true;
      Get.offAllNamed(Routes.home);
    }
  }

  void toRegister() {
    Get.toNamed(Routes.register);
  }

  String submitResult() {
    switch (result) {
      case LoginState.invalidLengthUsername: return 'Tài khoản có độ dài 6 - 18';
      case LoginState.invalidFormatUsername: return 'Tài khoản chỉ chứa ký tự, số, dấu gạch dưới';
      case LoginState.invalidLengthPassword: return 'Mật khẩu có độ dài 6 - 18';
      case LoginState.invalidFormatPassword: return 'Mật khẩu chỉ chứa ký tự, số, dấu gạch dưới';
      case LoginState.noUser: return 'Tài khoản không tồn tại';
      case LoginState.wrongPassword: return 'Mật khẩu không chính xác';
      default: return 'Đăng nhập thành công';
    }
  }
}
