
import 'package:get/get.dart';
import '../feature/list_card/binding/list_card_binding.dart';
import '../feature/list_card/views/list_card.dart';
import '../feature/list_topic/binding/list_topic_binding.dart';
import '../feature/list_topic/views/list_topic.dart';
import '../feature/home/binding/home_binding.dart';
import '../feature/home/views/home_screen.dart';
import '../feature/login/binding/login_binding.dart';
import '../feature/login/views/login_screen.dart';
import '../feature/register/binding/register_binding.dart';
import '../feature/register/view/register_screen.dart';

import 'app_routes.dart';

class AppPages {
  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.listTopic,
      page: () => const ListTopicScreen(),
      binding: ListTopicBinding(),
    ),
    GetPage(
      name: Routes.listCard,
      page: () => const ListCardScreen(),
      binding: ListCardBinding(),
    ),
  ];
}