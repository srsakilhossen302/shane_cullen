import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewRegistrationController extends GetxController {
  // Track if indemnity agreement is signed/accepted
  var isIndemnitySigned = false.obs;

  // Checklist items 1 to 9
  var agreedTo1 = false.obs;
  var agreedTo2 = false.obs;
  var agreedTo3 = false.obs;
  var agreedTo4 = false.obs;
  var agreedTo5 = false.obs;
  var agreedTo6 = false.obs;
  var agreedTo7 = false.obs;
  var agreedTo8 = false.obs;
  var agreedTo9 = false.obs;

  // Signature canvas points (represented as points list)
  var signaturePoints = <Offset?>[].obs;
  
  // Date selector
  var signatureDate = "07/07/2026".obs;

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
}
