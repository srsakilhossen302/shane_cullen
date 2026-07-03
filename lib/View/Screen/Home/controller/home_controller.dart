import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedCategory = 'Tournaments'.obs;
  var searchQuery = ''.obs;

  void selectCategory(String category) {
    selectedCategory.value = category;
  }
}
