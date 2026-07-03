import 'package:get/get.dart';

class RegistrationCategoryController extends GetxController {
  // Observables for checkboxes
  var isCompetitorSelected = false.obs;
  var isMatchOfficialSelected = false.obs;
  var isCampParticipantSelected = false.obs;
  var isSeminarParticipantSelected = false.obs;

  void toggleCompetitor() => isCompetitorSelected.toggle();
  void toggleMatchOfficial() => isMatchOfficialSelected.toggle();
  void toggleCampParticipant() => isCampParticipantSelected.toggle();
  void toggleSeminarParticipant() => isSeminarParticipantSelected.toggle();
}
