import 'package:get/get.dart';
import '../../View/Screen/Auth/login/controller/login_controller.dart';
import '../../View/Screen/SplashScreen/Controller/splash_screen_controller.dart';
import '../../View/Screen/Auth/register/controller/register_controller.dart';
import '../../View/Screen/Auth/forgot_password/controller/forgot_password_controller.dart';
import '../../View/Screen/Auth/register/controller/applicant_profile_controller.dart';
import '../../View/Screen/Auth/register/controller/parent_profile_controller.dart';
import '../../View/Screen/Home/controller/home_controller.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => RegisterController(), fenix: true);
    Get.lazyPut(() => ForgotPasswordController(), fenix: true);
    Get.lazyPut(() => ApplicantProfileController(), fenix: true);
    Get.lazyPut(() => ParentProfileController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
