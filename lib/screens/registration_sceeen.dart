import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/provider/add_registration_notifier.dart';
import 'package:loginapp/screens/loginscreen.dart';
import 'package:loginapp/screens/teachers_dashboard.dart';
import 'package:loginapp/services/add_registration_server.dart';
import 'package:loginapp/widgets/registration_textField.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  getDataFromServer() {
    print('Before Provider');
    RegistrationNotifier registrationNotifier =
        Provider.of<RegistrationNotifier>(context, listen: false);
    registrationNotifier.postRegistration();
    print('Aftr Provider');
  }

  _alertDialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Consumer<RegistrationNotifier>(
              builder: (context, registrationNotifier, _) {
                return Text(
                  registrationNotifier.registrationModel.message,
                  style: TextStyle(fontSize: 22),
                );
              },
            ),
            title: Text(
              'Register',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginDemo()));
                },
                child: Text('Ok'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text(
              'Registeration Form',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: <Widget>[
                  registrationTextField(context),
                  Align(
                    alignment: Alignment.centerRight,
                    child: RaisedButton(
                      color: Colors.red,
                      onPressed: () {
                        getDataFromServer();
                        _alertDialog(context);
                      },
                      splashColor: Colors.grey[200],
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
