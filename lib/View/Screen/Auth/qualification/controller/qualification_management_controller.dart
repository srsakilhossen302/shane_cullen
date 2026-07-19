import 'package:get/get.dart';

class QualificationManagementController extends GetxController {
  // Upload status variables (reactive)
  var isFullContactJudge = false.obs;
  var isFullContactReferee = false.obs;
  var isKataJudge = false.obs;
  var isPaddedContactJudge = false.obs;
  var isPaddedContactReferee = false.obs;
  var isNonContactJudge = false.obs;

  // File names variables (reactive)
  var fullContactJudgeFileName = "".obs;
  var fullContactRefereeFileName = "".obs;
  var kataJudgeFileName = "".obs;
  var paddedContactJudgeFileName = "".obs;
  var paddedContactRefereeFileName = "".obs;
  var nonContactJudgeFileName = "".obs;

  void setUploaded(String qualification, String fileName) {
    switch (qualification) {
      case "Full Contact Judge":
        isFullContactJudge.value = true;
        fullContactJudgeFileName.value = fileName;
        break;
      case "Full Contact Referee":
        isFullContactReferee.value = true;
        fullContactRefereeFileName.value = fileName;
        break;
      case "Kata Judge":
        isKataJudge.value = true;
        kataJudgeFileName.value = fileName;
        break;
      case "Padded Contact Judge":
        isPaddedContactJudge.value = true;
        paddedContactJudgeFileName.value = fileName;
        break;
      case "Padded Contact Referee":
        isPaddedContactReferee.value = true;
        paddedContactRefereeFileName.value = fileName;
        break;
      case "Non Contact Judge":
        isNonContactJudge.value = true;
        nonContactJudgeFileName.value = fileName;
        break;
    }
  }

  void clearUploaded(String qualification) {
    switch (qualification) {
      case "Full Contact Judge":
        isFullContactJudge.value = false;
        fullContactJudgeFileName.value = "";
        break;
      case "Full Contact Referee":
        isFullContactReferee.value = false;
        fullContactRefereeFileName.value = "";
        break;
      case "Kata Judge":
        isKataJudge.value = false;
        kataJudgeFileName.value = "";
        break;
      case "Padded Contact Judge":
        isPaddedContactJudge.value = false;
        paddedContactJudgeFileName.value = "";
        break;
      case "Padded Contact Referee":
        isPaddedContactReferee.value = false;
        paddedContactRefereeFileName.value = "";
        break;
      case "Non Contact Judge":
        isNonContactJudge.value = false;
        nonContactJudgeFileName.value = "";
        break;
    }
  }

  String getFileName(String qualification) {
    switch (qualification) {
      case "Full Contact Judge":
        return fullContactJudgeFileName.value;
      case "Full Contact Referee":
        return fullContactRefereeFileName.value;
      case "Kata Judge":
        return kataJudgeFileName.value;
      case "Padded Contact Judge":
        return paddedContactJudgeFileName.value;
      case "Padded Contact Referee":
        return paddedContactRefereeFileName.value;
      case "Non Contact Judge":
        return nonContactJudgeFileName.value;
      default:
        return "";
    }
  }

  bool isUploaded(String qualification) {
    switch (qualification) {
      case "Full Contact Judge":
        return isFullContactJudge.value;
      case "Full Contact Referee":
        return isFullContactReferee.value;
      case "Kata Judge":
        return isKataJudge.value;
      case "Padded Contact Judge":
        return isPaddedContactJudge.value;
      case "Padded Contact Referee":
        return isPaddedContactReferee.value;
      case "Non Contact Judge":
        return isNonContactJudge.value;
      default:
        return false;
    }
  }

  bool get hasAnySelection =>
      isFullContactJudge.value ||
      isFullContactReferee.value ||
      isKataJudge.value ||
      isPaddedContactJudge.value ||
      isPaddedContactReferee.value ||
      isNonContactJudge.value;
}
