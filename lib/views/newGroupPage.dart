import 'package:flutter/material.dart';
import 'package:hci_project/main.dart';
// ignore: unused_import
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:hci_project/views/groupPage.dart';
import 'package:hci_project/views/homePage.dart';

class newGroupPage extends StatefulWidget {
  const newGroupPage({super.key});

  @override
  State<newGroupPage> createState() => _newGroupPageState();
}

List<Option> _options = [
  Option(label: 'Visa', value: 1),
  Option(label: 'Mastercard', value: 2),
  Option(label: 'Postepay', value: 3),
];

List<bool> contactBool = [];
List<String> contactList = [
  "Annalaura",
  "Saad",
  "Emanuele",
  "Dionigi",
  "Kilian",
  "Christian",
  "Zoe",
  "Jason"
];
//Widget nameList = buildNameList();
final TitleController = TextEditingController();
final MemberController = TextEditingController();

bool checkVal = false;
int? _selectedValue;
int people = 0;

var firstScreenContext;

class _newGroupPageState extends State<newGroupPage> {
  @override
  Widget build(BuildContext context) {
    firstScreenContext = context;
    for (int i = 0; i < contactList.length; i++) {
      bool f = false;
      contactBool.add(f);
    }
    return Scaffold(
      body: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(padding: EdgeInsets.all(20)),
          Container(
              width: 150,
              height: 40,
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: ElevatedButton(
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cancel",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 19,
                            color: Color.fromARGB(255, 255, 255, 255),
                            letterSpacing: 1),
                      ),
                      Icon(Icons.close_rounded)
                    ],
                  ), /*child: */
                ),
                style: ButtonStyle(
                  //iconSize: MaterialStateProperty.all(25),
                  // padding:
                  //     MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                  // alignment: Alignment.center,
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 0, 0, 0)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
          Padding(padding: EdgeInsets.all(40)),
          Container(
            width: width,
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Text(
              "Create a new group",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(15)),
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Text(
              "Choose a new name for the group",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 15,
                color: Color.fromARGB(197, 0, 0, 0),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(5)),
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            width: width - 20,
            color: const Color.fromARGB(0, 255, 193, 7),
            child: TextField(
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 15,
                  color: Color.fromARGB(255, 0, 0, 0),
                  letterSpacing: 1),
              controller: TitleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                labelText: 'Name',
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(220)),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              width: 170,
              height: 40,
              child: ElevatedButton(
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Continue",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 19,
                            color: Color.fromARGB(255, 255, 255, 255),
                            letterSpacing: 1),
                      ),
                      Icon(Icons.arrow_forward_rounded)
                    ],
                  ),
                ),
                style: ButtonStyle(
                  //iconSize: MaterialStateProperty.all(25),
                  // padding:
                  //     MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                  // alignment: Alignment.center,
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 0, 0, 0)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(_createRoute());
                },
              ),
            ),
          )
        ]),
      ),
    );
  }
}

// SECOND ADDGROUP SCREEN

class newGroupPage2 extends StatefulWidget {
  const newGroupPage2({super.key});

  @override
  State<newGroupPage2> createState() => _newGroupPage2State();
}

class _newGroupPage2State extends State<newGroupPage2> {
  int people = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(20)),
            Container(
                width: 130,
                height: 40,
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: ElevatedButton(
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back_rounded),
                        Text(
                          "Back",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 19,
                              color: Color.fromARGB(255, 255, 255, 255),
                              letterSpacing: 1),
                        ),
                      ],
                    ), /*child: */
                  ),
                  style: ButtonStyle(
                    //iconSize: MaterialStateProperty.all(25),
                    // padding: MaterialStateProperty.all<EdgeInsets>(
                    //     EdgeInsets.all(10)),
                    alignment: Alignment.center,
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 0, 0, 0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
            Padding(padding: EdgeInsets.all(20)),
            Container(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Text(
                "Choose the members",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 37,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Container(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              width: width - 20,
              child: TextField(
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 15,
                    color: Color.fromARGB(255, 0, 0, 0),
                    letterSpacing: 1),
                controller: MemberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  labelText: 'Search a contact...',
                ),
              ),
            ),
            Container(
                color: Color.fromARGB(0, 0, 0, 0),
                width: width,
                height: height - 400,
                child: ListView.builder(
                  itemCount:
                      contactList.length, // Replace with your data list length
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        width: width - 50,
                        height: 50,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(contactList[index]),
                              customCheckBox(
                                name: contactList[index],
                                val: contactBool[index],
                              )
                            ]));
                  },
                )),
            Padding(padding: EdgeInsets.all(41)),
            Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  width: 170,
                  height: 40,
                  child: ElevatedButton(
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Continue",
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 19,
                                color: Color.fromARGB(255, 255, 255, 255),
                                letterSpacing: 1),
                          ),
                          Icon(Icons.arrow_forward_rounded)
                        ],
                      ),
                    ),
                    style: ButtonStyle(
                      //iconSize: MaterialStateProperty.all(25),
                      // padding: MaterialStateProperty.all<EdgeInsets>(
                      //     EdgeInsets.all(10)),
                      alignment: Alignment.center,
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 0, 0, 0)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(_createRoute2());
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

// SECOND ADDGROUP SCREEN

class newGroupPage3 extends StatefulWidget {
  const newGroupPage3({super.key});

  @override
  State<newGroupPage3> createState() => _newGroupPage3State();
}

class _newGroupPage3State extends State<newGroupPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(20)),
            Container(
                width: 130,
                height: 40,
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: ElevatedButton(
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back_rounded),
                        Text(
                          "Back",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 19,
                              color: Color.fromARGB(255, 255, 255, 255),
                              letterSpacing: 1),
                        ),
                      ],
                    ), /*child: */
                  ),
                  style: ButtonStyle(
                    //iconSize: MaterialStateProperty.all(25),
                    // padding: MaterialStateProperty.all<EdgeInsets>(
                    //     EdgeInsets.all(10)),
                    alignment: Alignment.center,
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 0, 0, 0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
            Padding(padding: EdgeInsets.all(20)),
            Container(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Text(
                "Choose the default payment method",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 37,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(7)),
            Container(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Text(
                "When a friend pays for you, your share of the expense is going to be automatically taken from this card.",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 15,
                  color: Color.fromARGB(255, 125, 125, 125),
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Container(
              color: Color.fromARGB(0, 0, 0, 0),
              width: width,
              height: height - 400,
              child: ListView.builder(
                itemCount: _options.length,
                itemBuilder: (context, index) {
                  final option = _options[index];
                  return RadioListTile<int>(
                    title: Text(option.label),
                    value: option.value,
                    groupValue: _selectedValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value;
                      });
                    },
                  );
                },
              ),
            ),
            Padding(padding: EdgeInsets.all(23)),
            Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  width: 130,
                  height: 40,
                  child: ElevatedButton(
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Done",
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 19,
                                color: Color.fromARGB(255, 255, 255, 255),
                                letterSpacing: 1),
                          ),
                          Icon(Icons.check_rounded)
                        ],
                      ),
                    ),
                    style: ButtonStyle(
                      //iconSize: MaterialStateProperty.all(25),
                      // padding: MaterialStateProperty.all<EdgeInsets>(
                      //     EdgeInsets.all(10)),
                      alignment: Alignment.center,
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 0, 0, 0)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (TitleController.text != "") {
                          groupContainer g = groupContainer(
                              amount: 0,
                              title: TitleController.text,
                              numMembers: people);
                          groupsList.add(g);

                          groupInfo gf = groupInfo(
                              groupName: TitleController.text,
                              partecipants: groupParticipants);
                          groupsInfo.add(gf);

                          groupView = updateview();
                        }
                      });
                      groupParticipants = [];
                      TitleController.text = "";

                      Navigator.of(context).push(_createDownRoute());
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class Option {
  final String label;
  final int value;

  Option({required this.label, required this.value});
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const newGroupPage2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _createRoute2() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const newGroupPage3(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _createDownRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, -1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

/*
Widget buildNameList() {
  return 
}*/

class customCheckBox extends StatefulWidget {
  final val;
  final name;
  const customCheckBox({super.key, this.val, this.name});

  @override
  State<customCheckBox> createState() =>
      customCheckBoxState(val: this.val, name: this.name);
}

List<String> groupParticipants = [];

class customCheckBoxState extends State<customCheckBox> {
  var val = false;
  final String name;

  customCheckBoxState({required this.val, required this.name}) {}

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: val,
        onChanged: (bool? value) {
          if (val == false) {
            people += 1;
            groupParticipants.add(this.name);
          }
          if (val == true) {
            people -= 1;
            if (groupParticipants.contains(this.name)) {
              groupParticipants.remove(this.name);
            }
          }
          setState(() {
            val = value!;
          });
          print(val);
          print(people);
        });
  }
}
