import 'package:get/get.dart';

class CampRegistrationController extends GetxController {
  // Toggle for grading intention
  var intendToGrade = false.obs;

  void toggleIntendToGrade() {
    intendToGrade.value = !intendToGrade.value;
  }
}
