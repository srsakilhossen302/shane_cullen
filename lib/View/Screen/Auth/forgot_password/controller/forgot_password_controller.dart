import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  var isLoading = false.obs;

  Future<void> sendResetLink(String email) async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;
  }
}
