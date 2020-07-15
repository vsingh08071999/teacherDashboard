import 'package:flutter/material.dart';
import 'package:loginapp/provider/add_group_notifier.dart';
import 'package:loginapp/provider/add_group_test_notifier.dart';
import 'package:loginapp/provider/add_question_notifier.dart';
import 'package:loginapp/provider/add_question_test_notifier.dart';
import 'package:loginapp/provider/add_registration_notifier.dart';
import 'package:loginapp/provider/create_test_notifier.dart';
import 'package:loginapp/provider/teacher_notifier.dart';
import 'package:loginapp/provider/view_question_notifier.dart';
import 'package:loginapp/provider/view_test_notifier.dart';
import 'package:loginapp/screens/add_question.dart';
import 'package:loginapp/screens/create_test.dart';
import 'package:loginapp/screens/loginscreen.dart';
import 'package:loginapp/screens/registration_sceeen.dart';
import 'package:provider/provider.dart';
import './provider/view_group_notifier.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UserNotifier>(
        create: (context) => UserNotifier(),
      ),
      ChangeNotifierProvider<ViewGroupNotifier>(
        create: (context) => ViewGroupNotifier(),
      ),
      ChangeNotifierProvider<AddGroupNotifier>(
        create: (context) => AddGroupNotifier(),
      ),
      ChangeNotifierProvider<ViewQuestionNotfier>(
        create: (context) => ViewQuestionNotfier(),
      ),
      ChangeNotifierProvider<CreateTestNotifier>(
        create: (context) => CreateTestNotifier(),
      ),
      ChangeNotifierProvider<AddQuestionNotifier>(
        create: (context) => AddQuestionNotifier(),
      ),
      ChangeNotifierProvider<TeacherNotifier>(
        create: (context) => TeacherNotifier(),
      ),
      ChangeNotifierProvider<RegistrationNotifier>(
        create: (context) => RegistrationNotifier(),
      ),
      ChangeNotifierProvider<AddQuestionToTestNotifier>(
        create: (context) => AddQuestionToTestNotifier(),
      ),
      ChangeNotifierProvider<AddGroupTestNotifier>(
        create: (context) => AddGroupTestNotifier(),
      )
    ],
    child: MaterialApp(
      //home: QuestionScreen(),
      // home: RegistrationScreen(),
      home: LoginDemo(),
      //home: AddQuestionToTest(),
      //home: AddQuestion(),
      //home: AddTest(),
      //home: Dashboard(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}
