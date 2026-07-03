import 'package:get/get.dart';

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
  }
}
