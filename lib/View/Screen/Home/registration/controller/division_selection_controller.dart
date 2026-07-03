import 'package:get/get.dart';

class DivisionSelectionController extends GetxController {
  // Observables for selections
  var selectedAgeGroup = "10-12 Years".obs;
  var selectedWeightDivision = "MIDDLEWEIGHT".obs;
  var selectedKata = "IKO MATSUSHIMA".obs;
  var selectedWeapons = "TRADITIONAL".obs;
  var isFullContact = false.obs;

  void selectAgeGroup(String age) {
    selectedAgeGroup.value = age;
  }

  void selectWeightDivision(String division) {
    selectedWeightDivision.value = division;
  }

  void selectKata(String kata) {
    selectedKata.value = kata;
  }

  void selectWeapons(String weapons) {
    selectedWeapons.value = weapons;
  }

  void toggleContactType() {
    isFullContact.toggle();
  }
}
