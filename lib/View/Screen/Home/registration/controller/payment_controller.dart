import 'package:get/get.dart';

class PaymentController extends GetxController {
  var cardNumber = "".obs;
  var expiryDate = "".obs;
  var cvv = "".obs;
  var cardHolderName = "".obs;

  bool get isValid =>
      cardNumber.value.length >= 16 &&
      expiryDate.value.contains("/") &&
      cvv.value.length >= 3 &&
      cardHolderName.value.isNotEmpty;
}
