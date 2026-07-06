import 'package:get/get.dart';

class NonContactRegistrationController extends GetxController {
  // Observable for the selected dojo name
  var selectedDojo = "".obs;

  // Observable for selected non-contact division
  var selectedAgeDivision = "OPEN – 4TH KYU AND ABOVE".obs;

  // Predefined Dojo list
  final List<String> dojos = [
    "Dhaka Dojo",
    "Auckland Central Dojo",
    "Sydney Karate Club",
    "Melbourne Honbu Dojo",
    "Wellington Kyokushin",
    "Christchurch Dojo",
    "Tokyo Shibucho Dojo",
    "Gold Coast Karate",
  ];

  void selectDojo(String dojo) {
    selectedDojo.value = dojo;
  }

  void selectAgeDivision(String division) {
    selectedAgeDivision.value = division;
  }
}
