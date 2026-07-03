import 'package:get/get.dart';

class AthleteCredentialsController extends GetxController {
  // Observables for weight, height, and rank selection
  var weight = "".obs;
  var height = "".obs;
  var selectedRank = "".obs;

  void selectRank(String rank) {
    selectedRank.value = rank;
  }
}
