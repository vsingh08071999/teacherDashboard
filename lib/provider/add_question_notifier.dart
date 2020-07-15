import 'package:flutter/cupertino.dart';
import 'package:loginapp/models/add_question_model.dart';
import 'package:loginapp/models/question_view_model.dart';
import 'package:loginapp/services/add_question_server.dart';
import 'package:loginapp/widgets/add_question_textField.dart';

class AddQuestionNotifier extends ChangeNotifier {
  AddQuestionServer _addQuestionServer = new AddQuestionServer();
  AddQuestionModel _addQuestionModel;
  AddQuestionModel get addQuestionModel => _addQuestionModel;
  Future<void> addQuestions(int uid) async {
    _addQuestionModel = await _addQuestionServer.addQuestion(
        uid,
        nameCon.text,
        scoreCon.text,
        n1.text,
        d1.text,
        a1.text,
        n2.text,
        d2.text,
        a2.text,
        n3.text,
        d3.text,
        a3.text,
        n4.text,
        d4.text,
        a4.text);
    notifyListeners();
  }

//  AddQuestionNotifier() {
//    addQuestions();
//  }
}
