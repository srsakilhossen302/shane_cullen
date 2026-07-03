import 'package:get/get.dart';
import '../../View/Screen/SplashScreen/splash_screen.dart';
import '../../View/Screen/Auth/login/login_screen.dart';
import '../../View/Screen/Auth/login/sign_in_screen.dart';
import '../../View/Screen/Auth/register/register_screen.dart';
import '../../View/Screen/Auth/forgot_password/forgot_password_screen.dart';
import '../../View/Screen/Auth/forgot_password/check_email_screen.dart';

class AppRoute {
  static const String splash = "/splash_screen";
  static const String login = "/login_screen";
  static const String register = "/register_screen";
  static const String signIn = "/sign_in_screen";
  static const String forgotPassword = "/forgot_password_screen";
  static const String checkEmail = "/check_email_screen";

  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: register,
      page: () => const RegisterScreen(),
    ),
    GetPage(
      name: signIn,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: forgotPassword,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(
      name: checkEmail,
      page: () => const CheckEmailScreen(),
    ),
  ];
}
