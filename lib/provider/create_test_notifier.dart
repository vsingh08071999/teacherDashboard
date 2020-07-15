import 'package:flutter/cupertino.dart';
import 'package:loginapp/models/test_add_model.dart';
import 'package:loginapp/models/test_view_model.dart';
import 'package:loginapp/services/create_test_server.dart';
import 'package:loginapp/widgets/create_test_textField.dart';

class CreateTestNotifier extends ChangeNotifier {
  CreateTestServer _createTestServer = new CreateTestServer();
  TestAddModel _testAddModel;
  TestAddModel get testAddModel => _testAddModel;
  Future<TestAddModel> createTests(int uid, String userid) async {
    _testAddModel = await _createTestServer.createTest(
        name.text,
        desc.text,
        attempts.text,
        duration.text,
        score.text,
        //createdBy.text,
        userid,
        uid
//        uid.text
        );
    notifyListeners();
  }
//  CreateTestNotifier() {
//    createTests();
//  }
}
