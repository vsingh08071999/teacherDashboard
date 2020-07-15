import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

Map<int, Color> color = {};
MaterialColor mainHeading = MaterialColor(0xFFc6e3eb, color);
MaterialColor grid1Color = MaterialColor(0xFFe8997d, color);
MaterialColor grid2Color = MaterialColor(0xFF92c79f, color);
MaterialColor grid3Color = MaterialColor(0xFF9f8bbc, color);
MaterialColor grid4Color = MaterialColor(0xFFe17678, color);
MaterialColor last1Color = MaterialColor(0xFF3b86dc, color);

class _DashboardState extends State<Dashboard> {
  _getContainer(String _title, IconData _icon, Color _color, double _width) {
    return Container(
      padding: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width * 0.43,
      height: MediaQuery.of(context).size.height * 0.11,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            _title,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(
            width: _width,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(
                _icon,
                color: Colors.white,
                size: 20,
              ),
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: _color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 8,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.filter_list,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                  SizedBox(
                    width: 300,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width * 0.90,
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
                          'https://pmcvariety.files.wordpress.com/2019/04/nawazuddin'
                          '-siddiqui-rexfeatures_9670910s.jpg'),
                      maxRadius: 25,
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
                          'Nawazuddin Siddique',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: Colors.black,
                              fontStyle: FontStyle.italic),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Delhi College of Arts',
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.w200),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 4,
                          width: 5,
                        ),
                        Text(
                          'B.Tech (Computer Science)',
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 33,
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          //xpadding: EdgeInsets.all(2),
                          height: 22,
                          // margin: EdgeInsets.only(bottom: 10,top: 10),
                          child: OutlineButton(
                            shape: OutlineInputBorder(),
                            padding: EdgeInsets.only(
                              left: 5,
                              right: 5,
                            ),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  '25',
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  ' Tests Assigned',
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 9, fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          //xpadding: EdgeInsets.all(2),
                          height: 22,
                          // margin: EdgeInsets.only(bottom: 10,top: 10),
                          child: OutlineButton(
                            shape: OutlineInputBorder(),
                            padding: EdgeInsets.only(
                              left: 5,
                              right: 5,
                            ),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  '40',
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  '      Teammates',
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 27,
                    ),
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.open_in_new,
                          color: Colors.black,
                          size: 12,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'HELLO',
                    softWrap: true,
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    ', Nawazuddin!',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  _getContainer('Exams', Icons.receipt, grid1Color, 85),
                  SizedBox(
                    width: 15,
                  ),
                  _getContainer(
                      'Discussions', Icons.question_answer, grid2Color, 37)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  _getContainer('Bookmarks', Icons.bookmark, grid3Color, 44),
                  SizedBox(
                    width: 15,
                  ),
                  _getContainer('Teachers', Icons.aspect_ratio, grid4Color, 63)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text('Recently Assigned Tests',
                  softWrap: true,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.30,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: last1Color,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Angular JS (Test & Deploy)',
                      softWrap: true,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 24),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Brain Mentors Pvt. Ltd.',
                      softWrap: true,
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Date:',
                          softWrap: true,
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                        Text(
                          ' 03,12,2019',
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Based On:',
                          softWrap: true,
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                        Text(
                          ' Topic 1,Topic 2,Topic 3',
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          'INTERMEDIATE',
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                child: Row(
                  children: <Widget>[
                    Text(
                      'Assigned Tests',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                      softWrap: true,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Featured Topics',
                      style: TextStyle(color: Colors.black, fontSize: 11),
                      softWrap: true,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Resources',
                      style: TextStyle(color: Colors.black, fontSize: 11),
                      softWrap: true,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Mock Tests',
                      style: TextStyle(color: Colors.black, fontSize: 11),
                      softWrap: true,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Live Sessions',
                      softWrap: true,
                      style: TextStyle(color: Colors.black, fontSize: 11),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
