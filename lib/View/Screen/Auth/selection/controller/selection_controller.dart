import 'package:get/get.dart';

class SelectionController extends GetxController {
  var selectedRole = 'Competitor'.obs;

  void selectRole(String role) {
    selectedRole.value = role;
  }
}
