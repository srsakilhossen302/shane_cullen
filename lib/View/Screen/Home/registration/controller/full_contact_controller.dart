import 'package:get/get.dart';

class FullContactController extends GetxController {
  // Tracks the active/registered full contact division
  var selectedDivision = "".obs;

  void selectDivision(String division) {
    selectedDivision.value = division;
  }
}
