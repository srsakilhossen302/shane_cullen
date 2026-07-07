import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var isEditing = false.obs;

  // Saved display values
  var fullName = "Shahriar Alom".obs;
  var email = "rabbik533@gmail.com".obs;
  var phone = "+880 1712-345678".obs;
  var dob = "5/15/1995".obs;
  var weight = "68".obs;
  var height = "120".obs;
  var belt = "Brown Belt".obs;
  var dojo = "Dhaka Martial Arts Center".obs;

  // Text controllers for editing mode
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController dobController;
  late TextEditingController weightController;
  late TextEditingController heightController;
  late TextEditingController dojoController;

  final List<String> belts = [
    "White Belt",
    "Yellow Belt",
    "Orange Belt",
    "Green Belt",
    "Blue Belt",
    "Brown Belt",
    "Black Belt",
  ];

  @override
  void onInit() {
    super.onInit();
    fullNameController = TextEditingController(text: fullName.value);
    emailController = TextEditingController(text: email.value);
    phoneController = TextEditingController(text: phone.value);
    dobController = TextEditingController(text: dob.value);
    weightController = TextEditingController(text: weight.value);
    heightController = TextEditingController(text: height.value);
    dojoController = TextEditingController(text: dojo.value);
  }

  void startEditing() {
    fullNameController.text = fullName.value;
    emailController.text = email.value;
    phoneController.text = phone.value;
    dobController.text = dob.value;
    weightController.text = weight.value;
    heightController.text = height.value;
    dojoController.text = dojo.value;
    isEditing.value = true;
  }

  void cancelEditing() {
    isEditing.value = false;
  }

  void saveChanges() {
    fullName.value = fullNameController.text;
    email.value = emailController.text;
    phone.value = phoneController.text;
    dob.value = dobController.text;
    weight.value = weightController.text;
    height.value = heightController.text;
    dojo.value = dojoController.text;
    isEditing.value = false;
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    dobController.dispose();
    weightController.dispose();
    heightController.dispose();
    dojoController.dispose();
    super.onClose();
  }
}
