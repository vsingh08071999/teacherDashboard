import 'package:flutter/cupertino.dart';
import 'package:loginapp/models/add_group_test_model.dart';
import 'package:loginapp/services/add_groups_to_test_server.dart';

class AddGroupTestNotifier extends ChangeNotifier {
  AddGroupsToTestServer _addGroupsToTestServer = new AddGroupsToTestServer();
  AddGroupTestModel _addGroupTestModel;
  AddGroupTestModel get addGroupTestModel => _addGroupTestModel;
  Future<void> addGroupTestNotifier(int testid, List qid) async {
    _addGroupTestModel =
        await _addGroupsToTestServer.addGroupsToTest(testid, qid);
    notifyListeners();
  }
}
