import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:soil_app/controllers/question_controller.dart';
import 'package:soil_app/models/faq_model.dart';
import 'package:soil_app/models/qa_model.dart';
import 'package:soil_app/utils/alert_helper.dart';

class QuestionProvider extends ChangeNotifier {
  final QuestionController _questionController = QuestionController();
  //---------store review list
  List<FAQModel> _faqList = [];

  List<FAQModel> get faqList => _faqList;

  Future<void> startFetchUserFAQ() async {
    try {
      _faqList = await _questionController.fetchFAQ();
      notifyListeners();
    } catch (e) {
      Logger().e(e);
    }
  }

  //---------store review list
  List<QAModel> _qaList = [];

  List<QAModel> get qaList => _qaList;

  Future<void> startFetchUserQA() async {
    try {
      _qaList = await _questionController.fetchQA();
      notifyListeners();
    } catch (e) {
      Logger().e(e);
    }
  }

  String answer = ' ';
  String datetime = DateTime.now().toString();

  //---qa controler
  final _question = TextEditingController();

  //--- get qa controller
  TextEditingController get question => _question;

  Future<void> startaddQuestion(BuildContext context) async {
    try {
      if (_question.text.isNotEmpty) {
        await _questionController
            .addQuestion(_question.text, answer, datetime)
            .then((value) => _question.clear());
      } else {
        //-----shows a error dialog
        AlertHelper.showAlert(context, "Validation error",
            "Fill all the fields", DialogType.error);
      }
    } catch (e) {
      Logger().e(e);
    }
  }
}
