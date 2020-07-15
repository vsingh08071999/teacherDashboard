import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/provider/teacher_notifier.dart';
import 'package:loginapp/provider/view_test_notifier.dart';
import 'package:loginapp/widgets/login_textfield.dart';
import 'package:provider/provider.dart';
import '../services/server.dart';
import '../widgets/fgbutton.dart';
import '../widgets/loginbutton.dart';
import '../models/model.dart';
import 'teachers_dashboard.dart';

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

Map<int, Color> color = {};
MaterialColor circleCustom = MaterialColor(0xFF1d499c, color);
MaterialColor backCustom = MaterialColor(0xFF9bcaf4, color);
MaterialColor buttonCustom = MaterialColor(0xFF2d228d, color);
MaterialColor facebookCustom = MaterialColor(0xFF1d499c, color);
MaterialColor googleCustom = MaterialColor(0xFFe25141, color);

class _LoginDemoState extends State<LoginDemo> {
  TextEditingController _tc1 = TextEditingController();
  TextEditingController _tc2 = TextEditingController();

  _getExamContainer() {
    return Container(
      padding: EdgeInsets.only(bottom: 108),
      color: backCustom,
      height: MediaQuery.of(context).size.height * 0.30,
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 20,
            width: 7,
          ),
          CircleAvatar(
            child: Text(
              'Exam',
              style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            maxRadius: 38,
            backgroundColor: circleCustom,
          ),
          SizedBox(
            height: 20,
            width: 7,
          ),
          Text(
            'APP',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }

  _alertDialog() {
    return showDialog(
        builder: (context) {
          return AlertDialog(
              actionsOverflowDirection: VerticalDirection.up,
              title: Text('LOGIN'),
              content: Consumer<TeacherNotifier>(
                builder: (context, teacherNotifier, _) {
                  switch (teacherNotifier.state) {
                    case TeacherStatusNotifier.loading:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    case TeacherStatusNotifier.loaded:
                      return Text(teacherNotifier.user.message);
                    default:
                      return Center(
                        child: Text(teacherNotifier.error),
                      );
                  }
                },
              ),
              actions: <Widget>[
                FlatButton(
                    onPressed: () async {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TeacherDashBoard()));
                    },
                    child: Text('Ok'))
              ]);
        },
        context: context);
  }

  _getDataFromServer() {
    TeacherNotifier teacherNotifier =
        Provider.of<TeacherNotifier>(context, listen: false);
    teacherNotifier.postTeacher();
    print('Data has been fetched');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _getExamContainer(),
              SizedBox(
                height: 7,
              ),
              Text('Sign In',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 7,
              ),
              loginTextSection(),
              SizedBox(
                height: 7,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    child: FlatButton(
                      padding: EdgeInsets.all(5),
                      onPressed: () {
                        _alertDialog();
                        _getDataFromServer();
                        // teacherNotifier.postTeacher();
                      },
                      splashColor: Colors.white10,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      color: buttonCustom,
                    ),
                  ),

                  //LoginButton(facebookCustom, Server.signIn),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 35,
                      ),
                      Text(
                        'Remember Me',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      FlatButton(
                        color: Colors.white24,
                        onPressed: () {},
                        splashColor: Colors.black,
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        FGButton('f', facebookCustom),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.32,
                        ),
                        FGButton('G', googleCustom)
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        "Don't have Account?",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      FlatButton(
                        color: Colors.white24,
                        onPressed: () {},
                        splashColor: Colors.black,
                        child: Text(
                          'SignUp',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
