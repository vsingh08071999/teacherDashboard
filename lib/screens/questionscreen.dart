import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'dart:convert' as json;
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  Timer _timer;
  var _start = 30;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (Timer _timer) {
      setState(() {
        if (_start < 1) {
          _timer.cancel();
          _nextQuestion();
          _previousQuestion();
        } else {
          return _start = _start - 1;
        }
      });
    });
  }

  @override
  initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  _getUpperContainer() {
    return Container(
      padding: EdgeInsets.all(13),
      height: MediaQuery.of(context).size.height * 0.14,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(13),
              bottomLeft: Radius.circular(13)),
          color: Colors.orangeAccent),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.arrow_left,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.70,
              ),
              Icon(
                Icons.forward,
                color: Colors.white,
                size: 22,
              ),
              SizedBox(
                width: 7,
              ),
              Icon(
                Icons.bookmark,
                color: Colors.white,
                size: 22,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 30),
            child: Row(
              children: <Widget>[
                Text(
                  'Question No. ',
                  softWrap: true,
                  style: TextStyle(color: Colors.white, fontSize: 23),
                ),
                Text(
                  '0$i',
                  softWrap: true,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.20,
                ),
                Text(
                  '$_start',
                  softWrap: true,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  ' (TIME LEFT)',
                  softWrap: true,
                  style: TextStyle(color: Colors.white, fontSize: 11),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _getLowerContainer() {
    return DraggableScrollableSheet(
      maxChildSize: 1,
      minChildSize: 0.25,
      //initialChildSize: 0,
      builder: (context, myController) {
        return ListView(
          controller: myController,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(13),
                    topRight: Radius.circular(13)),
                color: Color(0xFF2d228d),
              ),
              padding: EdgeInsets.only(left: 10, bottom: 5, right: 10, top: 5),
              height: MediaQuery.of(context).size.height * 34.0,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 180, right: 180, bottom: 0),
                    height: 20,
                    width: MediaQuery.of(context).size.width,
                    child: CustomPaint(
                      //size: Size(0.5,100),
                      painter: MyPainter(),
                    ),
                  ),
                  Text(
                    'Questions List',
                    softWrap: true,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
//                SizedBox(
//                  height: MediaQuery.of(context).size.height * 0.20,
//                ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(7, 15, 7, 10),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 6,
                        child: GridView.count(
                            crossAxisCount: 8,
                            children: List.generate(40, (index) {
                              return FittedBox(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: FlatButton(
                                    //shape: Border.all(style: BorderStyle.solid),
                                    onPressed: () {},
                                    color: Colors.white,
                                    child: Text(
                                      '$index',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              );
                            })),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.15,
                      ),
                      RaisedButton(
                        color: Colors.orangeAccent,
                        onPressed: () {
                          _previousQuestion();
                          setState(() {
                            startTimer();
                          });
                        },
                        child: Text(
                          'PREVIUOS',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            decorationStyle: TextDecorationStyle.solid,
                          ),
                        ),
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)),
                        splashColor: Color(0xFF2d228d),
                        highlightColor: Color(0xFF2d228d),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                      ),
                      RaisedButton(
                        color: Colors.orangeAccent,
                        onPressed: () {
                          _nextQuestion();
                          setState(() {
                            startTimer();
                          });
                        },
                        child: Text(
                          'NEXT',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            decorationStyle: TextDecorationStyle.solid,
                          ),
                        ),
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)),
                        splashColor: Color(0xFF2d228d),
                        highlightColor: Color(0xFF2d228d),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  int i = 1;
  _nextQuestion() {
    _start = 30;
    setState(() {
      if (i < 10) {
        i++;
      } else {
        return 0;
      }
    });
  }

  _previousQuestion() {
    _start = 30;
    setState(() {
      if (i < 10) {
        i--;
      } else {
        return 0;
      }
    });
  }

  _getMidContainer() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.48,
      child: FutureBuilder(
        builder: (context, asyncSnapShot) {
          List myData = json.jsonDecode(asyncSnapShot.data.toString());
          if (myData == null) {
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              height: MediaQuery.of(context).size.height * 0.48,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                        //alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 20, top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Q$i. ',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w700),
                            ),
                            Text(myData[0][i.toString()],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500))
                          ],
                        )),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                myData[1][i.toString()]['a'],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                                maxLines: 2,
                              ),
                              color: Colors.orangeAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              splashColor: Color(0xFF2d228d),
                              highlightColor: Color(0xFF2d228d),
                              minWidth: 200,
                              height: 46,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                myData[1][i.toString()]['b'],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                                maxLines: 2,
                              ),
                              color: Colors.orangeAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              splashColor: Color(0xFF2d228d),
                              highlightColor: Color(0xFF2d228d),
                              minWidth: 200,
                              height: 46,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                myData[1][i.toString()]['c'],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                                maxLines: 2,
                              ),
                              color: Colors.orangeAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              splashColor: Color(0xFF2d228d),
                              highlightColor: Color(0xFF2d228d),
                              minWidth: 200,
                              height: 46,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                myData[1][i.toString()]['d'],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                                maxLines: 2,
                              ),
                              color: Colors.orangeAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              splashColor: Color(0xFF2d228d),
                              highlightColor: Color(0xFF2d228d),
                              minWidth: 200,
                              height: 46,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        },
        future: DefaultAssetBundle.of(context)
            .loadString('question_json/question.json'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              _getUpperContainer(),
              // _midCon(),
              _getMidContainer(),
              Expanded(
                child: _getLowerContainer(),
              ),
            ],
          )
        ],
      )),
    );
  }
}

class MyPainter extends CustomPainter {
  void paint(canvas, size) {
    var paint = Paint();
    paint.color = Colors.white;
    paint.strokeWidth = 2.5;
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );
  }

  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
