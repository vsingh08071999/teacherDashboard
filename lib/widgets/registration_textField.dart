import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextEditingController userid = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController name = TextEditingController();
TextEditingController address = TextEditingController();
TextEditingController phoneNo = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController role = TextEditingController();
TextEditingController regCode = TextEditingController();
registrationTextField(context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      textFields('UserId', context, userid),
      textFields('Password', context, password),
      textFields('Name', context, name),
      textFields('Address', context, address),
      textFields('Phone No.', context, phoneNo),
      textFields('Email', context, email),
      // textFields('Role', context, role),
      DropDownItems(),
      //RegCodeField()
      // textFields('RegCode', context, regCode),
    ],
  );
}

Widget textFields(name, context, controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: TextFormField(
      controller: controller,
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
          hintText: name,
          hintStyle: TextStyle(
              color: Colors.grey[450],
              fontSize: 20,
              fontWeight: FontWeight.w300)),
    ),
  );
}

class RegCodeField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        //controller: controller,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
            //  hintText: name,
            hintStyle: TextStyle(
                color: Colors.grey[450],
                fontSize: 20,
                fontWeight: FontWeight.w300)),
      ),
    );
  }
}

String selectedValue;

class DropDownItems extends StatefulWidget {
  @override
  _DropDownItemsState createState() => _DropDownItemsState();
}

class _DropDownItemsState extends State<DropDownItems> {
  List<String> itemList = ['Student', 'Teacher'];
  getTextFields(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        // controller: controller,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
            hintText: name,
            hintStyle: TextStyle(
                color: Colors.grey[450],
                fontSize: 20,
                fontWeight: FontWeight.w300)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Role",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          DropdownButton<String>(
            items: itemList
                .map((String singleItem) => DropdownMenuItem<String>(
                      child: Text(
                        singleItem,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      value: singleItem,
                    ))
                .toList(),
            onChanged: (String itemSelected) {
              setState(() {
                selectedValue = itemSelected;
                if (selectedValue == "Student") {
                  print('Student');
                  // getTextField();
                } else
                  print('teacher');
              });
            },
            value: selectedValue,
            iconSize: 30,
            hint: Text(
              "Choose role",
              style: TextStyle(fontSize: 19),
            ),
          )
        ],
      ),
    );
  }
}
