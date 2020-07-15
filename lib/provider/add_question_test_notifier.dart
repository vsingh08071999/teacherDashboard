import 'package:flutter/cupertino.dart';
import 'package:loginapp/models/add_question_test_model.dart';
import 'package:loginapp/services/add_questions_to_test_server.dart';

class AddQuestionToTestNotifier extends ChangeNotifier {
  AddQuestionsToTestServer _addQuestionsToTestServer =
      new AddQuestionsToTestServer();
  AddQuestionTestModel _addQuestionTestModel;
  AddQuestionTestModel get addQuestionTestModel => _addQuestionTestModel;
  Future<void> addQuestionTestNotifier(int testid, List qid) async {
    _addQuestionTestModel =
        await _addQuestionsToTestServer.addQuestionsToTest(testid, qid);
    notifyListeners();
  }
}
