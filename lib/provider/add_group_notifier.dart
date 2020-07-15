import 'package:flutter/cupertino.dart';
import 'package:loginapp/models/group_view_model.dart';
import 'package:loginapp/screens/create_group.dart';
import 'package:loginapp/services/addGroup_server.dart';
import 'package:loginapp/widgets/add_group_textfield.dart';
import '../models/group_add_model.dart';

class AddGroupNotifier extends ChangeNotifier {
  GroupAddModel _groupAddModel;
  AddGroup _addGroup = new AddGroup();
  GroupAddModel get groupAddModel => _groupAddModel;
  Future<GroupAddModel> postGroup(int uid) async {
    _groupAddModel = await _addGroup.addGroup(
        //uidController.text,
        uid,
        nameController.text,
        descController.text);
    notifyListeners();
  }

//  AddGroupNotifier() {
//    postGroup();
//  }
}
