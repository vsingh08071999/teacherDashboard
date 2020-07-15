import 'package:flutter/cupertino.dart';
import 'package:loginapp/models/registration_model.dart';
import 'package:loginapp/services/add_registration_server.dart';
import 'package:loginapp/widgets/registration_textField.dart';

class RegistrationNotifier extends ChangeNotifier {
  AddRegistrationServer _addRegistrationServer = new AddRegistrationServer();
  RegistraionModel _registraionModel;
  RegistraionModel get registrationModel => _registraionModel;
  RegistrationNotifier() {
    postRegistration();
  }
  Future<void> postRegistration() async {
    _registraionModel = await _addRegistrationServer.getRegistration(
      userid.text,
      password.text,
      name.text,
      address.text,
      phoneNo.text,
      email.text,
      selectedValue,
//      regCode.text,
    );
    notifyListeners();
  }
}
