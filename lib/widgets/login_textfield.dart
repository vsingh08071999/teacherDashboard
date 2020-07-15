import 'package:flutter/material.dart';

TextEditingController usertxt = new TextEditingController();
TextEditingController passwordtxt = new TextEditingController();

Container loginTextSection() {
  return Container(
    padding: EdgeInsets.all(15),
    child: Column(
      children: <Widget>[
        txtUsername("Username", usertxt),
        SizedBox(
          height: 30,
        ),
        txtPassword("Password", passwordtxt),
      ],
    ),
  );
}

Widget txtUsername(String title, control) {
  return TextFormField(
    controller: control,
    style: TextStyle(fontSize: 20, color: Colors.black),
    decoration: InputDecoration(
      prefixIcon: Icon(
        Icons.person,
        color: Colors.grey,
      ),
      hintText: title, hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
      // hintStyle: TextStyle(color: Colors.white),
      contentPadding: EdgeInsets.all(10),
    ),
  );
}

Widget txtPassword(String title, control) {
  return TextFormField(
    obscureText: true,
    controller: control,
    style: TextStyle(fontSize: 20, color: Colors.black),
    decoration: InputDecoration(
      prefixIcon: Icon(
        Icons.lock_open,
        color: Colors.grey,
      ),
      hintText: title, hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
      // hintStyle: TextStyle(color: Colors.white),
      contentPadding: EdgeInsets.all(10),
    ),
  );
}
