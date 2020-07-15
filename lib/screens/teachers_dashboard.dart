import 'package:flutter/material.dart';
import 'package:loginapp/models/add_question_test_model.dart';
import 'package:loginapp/provider/add_group_notifier.dart';
import 'package:loginapp/provider/add_question_test_notifier.dart';
import 'package:loginapp/provider/teacher_notifier.dart';
import 'package:loginapp/provider/view_group_notifier.dart';
import 'package:loginapp/provider/view_question_notifier.dart';
import 'package:loginapp/provider/view_test_notifier.dart';
import 'package:loginapp/screens/add_group_test.dart';
import 'package:loginapp/screens/add_questions_to_test.dart';
import 'package:loginapp/screens/create_test.dart';
import 'package:loginapp/screens/dashboard_screen.dart';
import 'package:loginapp/screens/view_group.dart';
import 'package:loginapp/screens/view_question.dart';
import 'package:loginapp/screens/view_test.dart';
import 'package:loginapp/services/getAllGroups_server.dart';
import 'package:loginapp/services/getAllTest_server.dart';
import 'package:loginapp/services/getAllQuestionsByUser_server.dart';
import 'package:provider/provider.dart';
import '../models/model.dart';
import '../services/server.dart';
import 'add_question.dart';
import 'create_group.dart';

class TeacherDashBoard extends StatefulWidget {
  int userId;
  @override
  _TeacherDashBoardState createState() => _TeacherDashBoardState(userId);
}

Map<int, Color> color = {};
MaterialColor mainHeading = MaterialColor(0xFFc6e3eb, color);

class _TeacherDashBoardState extends State<TeacherDashBoard> {
  int userId;
  _TeacherDashBoardState(userId);

  _drawerHeader() {
    return DrawerHeader(
      child: Text(
        'Teacher',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 40,
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black, spreadRadius: 2)],
        color: Colors.deepOrangeAccent,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var uid = Provider.of<TeacherNotifier>(context, listen: false).user.uid;
    Provider.of<UserNotifier>(context, listen: false).getTest(uid);
    Provider.of<ViewQuestionNotfier>(context, listen: false).getQuestions(uid);
    Provider.of<ViewGroupNotifier>(context, listen: false).getGroup(uid);
  }

  @override
  Widget build(BuildContext context) {
    TeacherNotifier teacherNotifier = Provider.of<TeacherNotifier>(context);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 5,
            backgroundColor: Colors.red,
            title: Text('Teacher DashBoard'),
          ),
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width,
                    child: _drawerHeader()),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'Create Test',
                          style: TextStyle(fontSize: 25),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateTest()));
                        },
                      ),
                      ListTile(
                        title: Text(
                          'View Test',
                          style: TextStyle(fontSize: 25),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewTest()));
                        },
                      ),
                      ListTile(
                        title: Text(
                          'Add Question',
                          style: TextStyle(fontSize: 25),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddQuestion()));
                        },
                      ),
                      ListTile(
                        title: Text(
                          'View Question',
                          style: TextStyle(fontSize: 25),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewQuestion()));
                        },
                      ),
                      ListTile(
                        title: Text(
                          'Create Group',
                          style: TextStyle(fontSize: 25),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateGroup()));
                        },
                      ),
                      ListTile(
                        title: Text(
                          'View Group',
                          style: TextStyle(fontSize: 25),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewGroup()));
                        },
                      ),
                      ListTile(
                        title: Text(
                          'AddQuestionsToTest',
                          style: TextStyle(fontSize: 25),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddQuestionsToTest()));
                        },
                      ),
                      ListTile(
                        title: Text(
                          'AddGroupsToTest',
                          //teacherNotifier.user.rights[23].createGroup,
                          style: TextStyle(fontSize: 25),
                        ),
                        onTap: () {
                          // var info = await GetAllGroup.getAllGroup();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddGroupTest()));
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: mainHeading,
            ),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://uinterview.com/wp-content/uploads/2015/09/Kai_Greene.jpg'),
                  maxRadius: 50,
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      'Vishal Singh',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.black,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'RIET',
                      softWrap: true,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 4,
                      width: 5,
                    ),
                    Text(
                      'B.Tech (Computer Science)',
                      softWrap: true,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
