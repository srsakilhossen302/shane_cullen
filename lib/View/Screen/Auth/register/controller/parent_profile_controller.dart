import 'package:get/get.dart';
import '../../../../../Core/AppRoute/app_route.dart';
import '../../../../../helper/shared_prefe/shared_prefe.dart';

class ParentProfileController extends GetxController {
  var selectedGender = 'Male'.obs;
  var isLoading = false.obs;

  void setGender(String gender) {
    selectedGender.value = gender;
  }

  Future<void> completeRegistration() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 1500));
    isLoading.value = false;

    final role = await PrefsHelper.getString(PrefsHelper.userRole);
    if (role == 'Match Official') {
      Get.offAllNamed(AppRoute.qualificationManagement);
    } else {
      Get.offAllNamed(AppRoute.home);
    }
  }
}
