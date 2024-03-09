import 'package:aarcon/Controllers/InternetController.dart';
import 'package:aarcon/Models/login_form_validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreenController extends GetxController {
  late final GetStorage getStorage;
  final InternetController networkManager = Get.find<InternetController>();

  late FocusNode nameNode, eventNode, dateNode, timeNode, matterNode, noteNode;

  late TextEditingController nameCtr,
      eventCtr,
      dateCtr,
      timeCtr,
      matterCtr,
      noteCtr;

  // Rx<ScreenState> state = ScreenState.apiLoading.obs;

  final formKey = GlobalKey<FormState>();
  RxBool obsecureText = true.obs;
  DateTime selectedDate = DateTime.now();

  String approxTime = "";

  void updateApproxtime(date) {
    timeCtr.text = date;
    print("PICKED_DATE${timeCtr.value}");
    update();
  }

  @override
  void onInit() {
    getStorage = GetStorage();

    nameNode = FocusNode();
    eventNode = FocusNode();
    dateNode = FocusNode();
    timeNode = FocusNode();
    matterNode = FocusNode();
    noteNode = FocusNode();

    nameCtr = TextEditingController();
    eventCtr = TextEditingController();
    dateCtr = TextEditingController();
    timeCtr = TextEditingController();
    matterCtr = TextEditingController();
    noteCtr = TextEditingController();

    enableSignUpButton();
    super.onInit();
  }

  void updateDate(date) {
    dateCtr.text = date;
    update();
  }

  var isLoading = false.obs;
  var nameModel = ValidationModel(null, null, isValidate: false).obs;
  var eventModel = ValidationModel(null, null, isValidate: false).obs;
  var dateModel = ValidationModel(null, null, isValidate: false).obs;
  var timeModel = ValidationModel(null, null, isValidate: false).obs;
  var matterModel = ValidationModel(null, null, isValidate: false).obs;
  var noteModel = ValidationModel(null, null, isValidate: false).obs;

  void enableSignUpButton() {
    if (nameModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (eventModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (dateModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (timeModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (matterModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (noteModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else {
      isFormInvalidate.value = true;
    }
  }

  void validateName(String? val) {
    nameModel.update((model) {
      if (val != null && val.toString().trim().isEmpty) {
        model!.error = "Enter Email Id";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });

    enableSignUpButton();
  }

  void validateEvent(String? val) {
    eventModel.update((model) {
      if (val == null || val.toString().trim().isEmpty) {
        model!.error = "Enter Password";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });
    enableSignUpButton();
  }

  void validateDate(String? val) {
    dateModel.update((model) {
      if (val == null || val.toString().trim().isEmpty) {
        model!.error = "Select Date";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });
    enableSignUpButton();
  }

  void validateTime(String? val) {
    eventModel.update((model) {
      if (val == null || val.toString().trim().isEmpty) {
        model!.error = "Select Time";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });
    enableSignUpButton();
  }

  void validateMatter(String? val) {
    eventModel.update((model) {
      if (val == null || val.toString().trim().isEmpty) {
        model!.error = "Enter Matter";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });
    enableSignUpButton();
  }

  void validateNote(String? val) {
    eventModel.update((model) {
      if (val == null || val.toString().trim().isEmpty) {
        model!.error = "Enter Note";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });
    enableSignUpButton();
  }

  RxBool isFormInvalidate = false.obs;

  void hideKeyboard(context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
