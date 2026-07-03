import 'package:get/get.dart';
import 'english.dart';

class AppTranslator extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': english,
  };
}
