import 'package:get/get.dart';

class ReviewRegistrationController extends GetxController {
  // Track if indemnity agreement is signed/accepted
  var isIndemnitySigned = false.obs;

  void signIndemnity() {
    isIndemnitySigned.value = true;
  }
}
