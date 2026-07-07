import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchOfficialsController extends GetxController {
  // 1. Grade
  var selectedGrade = "".obs;
  final List<String> grades = [
    "10th Kyu",
    "9th Kyu",
    "8th Kyu",
    "7th Kyu",
    "6th Kyu",
    "5th Kyu",
    "4th Kyu",
    "3rd Kyu",
    "2nd Kyu",
    "1st Kyu",
    "1st Dan",
    "2nd Dan",
    "3rd Dan",
    "4th Dan",
    "5th Dan +",
  ];

  // 2. Organisation
  var selectedOrganisation = "".obs;

  // 3. Dojo
  final dojoNameController = TextEditingController();

  // 4. Accreditation
  final List<String> accreditationList = [
    "State Non-Contact Judge",
    "State Non-Contact Referee",
    "State Full Contact Judge",
    "State Full Contact Referee",
    "National Non-Contact Judge",
    "National Non-Contact Referee",
    "National Full Contact Judge",
    "National Full Contact Referee",
    "International Judge",
    "International Referee",
    "WMAC Class A",
    "Ring Karate Judge",
    "Ring Karate Referee",
  ];
  var selectedAccreditations = <String>{}.obs;

  final certificateNoController = TextEditingController();
  final dateIssuedController = TextEditingController();
  var uploadedCertificateName = "".obs;

  // 5, 6, 7. Seminar
  final lastSeminarDateController = TextEditingController();
  final lastSeminarLocationController = TextEditingController();
  var seminarFacilitatorType = "Sempai".obs;
  final List<String> facilitatorTypes = ["Sempai", "Sensei", "Shihan", "Other"];
  final facilitatorNameController = TextEditingController();

  // 8. Tournament Categories I wish to be a Match Official
  var selectedCategories = <String>{}.obs;

  // 10. Indemnity (aligned with competitor indemnity variables)
  var isIndemnitySigned = false.obs;
  var agreedTo1 = false.obs;
  var agreedTo2 = false.obs;
  var agreedTo3 = false.obs;
  var agreedTo4 = false.obs;
  var agreedTo5 = false.obs;
  var agreedTo6 = false.obs;
  var agreedTo7 = false.obs;
  var agreedTo8 = false.obs;
  var agreedTo9 = false.obs;
  var signaturePoints = <Offset?>[].obs;
  var signatureDate = "08/07/2026".obs;

  void signIndemnity() {
    isIndemnitySigned.value = true;
  }

  void clearSignature() {
    signaturePoints.clear();
  }

  bool get canAccept =>
      agreedTo1.value &&
      agreedTo2.value &&
      agreedTo3.value &&
      agreedTo4.value &&
      agreedTo5.value &&
      agreedTo6.value &&
      agreedTo7.value &&
      agreedTo8.value &&
      agreedTo9.value &&
      signaturePoints.isNotEmpty;

  @override
  void onClose() {
    dojoNameController.dispose();
    certificateNoController.dispose();
    dateIssuedController.dispose();
    lastSeminarDateController.dispose();
    lastSeminarLocationController.dispose();
    facilitatorNameController.dispose();
    super.onClose();
  }

  void toggleAccreditation(String item) {
    if (selectedAccreditations.contains(item)) {
      selectedAccreditations.remove(item);
    } else {
      selectedAccreditations.add(item);
    }
  }

  void toggleCategory(String categoryKey) {
    if (selectedCategories.contains(categoryKey)) {
      selectedCategories.remove(categoryKey);
    } else {
      selectedCategories.add(categoryKey);
    }
  }
}
