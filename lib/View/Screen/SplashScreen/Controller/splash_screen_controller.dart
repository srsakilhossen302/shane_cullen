import 'package:get/get.dart';
import '../../../../Core/AppRoute/app_route.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoute.login);
    });
  }
}
