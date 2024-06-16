import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hci_project/main.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:hci_project/views/groupPage.dart';
import 'package:hci_project/views/homePage.dart';

class newGroupPage extends StatefulWidget {
  const newGroupPage({super.key});

  @override
  State<newGroupPage> createState() => _newGroupPageState();
}

//List<String> _filteredItems = [];
//List<int> _filteredLinkedItems = [];

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
  "Jason",

];
//Widget nameList = buildNameList();
final TitleController = TextEditingController();
final MemberController = TextEditingController();

bool checkVal = false;
int? _selectedValue = -1;
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
        body: Stack(children: [
      Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(padding: EdgeInsets.all(60)),
          Container(
            width: width,
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Text(
              "Create a new group",
              style: TextStyle(
                fontFamily: "impact",
                fontSize: 45,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(40)),
          Container(
            padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
            child: Text(
              "Choose a new name for the group",
              style: TextStyle(
                fontFamily: "impact",
                fontSize: 15,
                color: Color.fromARGB(128, 0, 0, 0),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(2)),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            width: width - 20,
            color: const Color.fromARGB(0, 255, 193, 7),
            child: TextField(
              style: TextStyle(
                  fontFamily: "impact",
                  fontSize: 15,
                  color: Color.fromARGB(255, 0, 0, 0),
                  letterSpacing: 1),
              controller: TitleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                labelText: '',
              ),
            ),
          ),
        ]),
      ),
      Positioned(
        bottom: 25,
        right: 20,
        child: ElevatedButton(
            child: Text(
              "continue",
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
                  letterSpacing: 1),
            ),
            onPressed: () {
              if (TitleController.text != "") {
                Navigator.of(context).push(_createRoute());
              }
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(40, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              backgroundColor: Colors.black,
            )),
      ),
      Positioned(
        top: 40,
        left: 20,
        child: ElevatedButton(
            child: Icon(Icons.close_rounded, size: 30, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(60, 60),
              shape: CircleBorder(),
              backgroundColor: Colors.black,
            )),
      ),
    ]));
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
        body: Stack(children: [
      Container(
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(60)),
            Container(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Text(
                "Choose the members",
                style: TextStyle(
                  fontFamily: "impact",
                  fontSize: 37,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Visibility(
              visible: false,
              child:  Container(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              width: width - 20,
              child: TextField(
                style: TextStyle(
                    fontFamily: "impact",
                    fontSize: 15,
                    color: Color.fromARGB(143, 0, 0, 0),
                    letterSpacing: 1),
                controller: MemberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  labelText: 'Search a contact',
                ),
              ),
            ),),
           
            Container(
                color: Color.fromARGB(0, 0, 0, 0),
                width: width,
                height: height - 400,
                child: ListView.builder(
                  itemCount: contactList.length,
                  itemBuilder: (BuildContext context, int index) {
                   // print(_filteredLinkedItems);
                    return Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        width: width - 50,
                        height: 50,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                contactList[index],
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'impact'),
                              ),
                              customCheckBox(
                                name: contactList[index],
                                val: contactBool[index],
                              )
                            ]));
                  },
                )),
          ],
        ),
      ),
      Positioned(
        bottom: 25,
        right: 20,
        child: ElevatedButton(
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
            onPressed: () {
              print("pressed");
              if (groupParticipants.length > 0) {
                setState(() {
                  int r = Random().nextInt(imageStrings.length);
                  if (TitleController.text != "") {
                    people += 1;
                    groupParticipants.add("You");
                    groupContainer g = groupContainer(
                        imageGroup: imageStrings[r],
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
                //_selectedValue = -1;
                Navigator.of(context).push(_createDownRoute());
                MemberController.text = "";
              }
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(40, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              backgroundColor: Colors.black,
            )),
      ),
      Positioned(
        top: 40,
        left: 20,
        child: ElevatedButton(
            child:
                Icon(Icons.arrow_back_rounded, size: 30, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(60, 60),
              shape: CircleBorder(),
              backgroundColor: Colors.black,
            )),
      ),
    ]));
  }

 /* void _filterItems() {
    setState(() {
      _filteredItems = [];
      _filteredLinkedItems = [];

      for (int i = 0; i < contactList.length; i++) {
        if (contactList[i]
            .toLowerCase()
            .contains(MemberController.text.toLowerCase())) {
          print(i);
          _filteredItems.add(contactList[i]);
          _filteredLinkedItems.add(i);
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _filteredItems.addAll(contactList);
    for (int k = 0; k < contactBool.length; k++) {
      _filteredLinkedItems.add(k);
    }

    MemberController.addListener(_filterItems);
  }

  @override
  void dispose() {
    MemberController.removeListener(_filterItems);
    MemberController.dispose();
    super.dispose();
  }*/
}

// SECOND ADDGROUP SCREEN
/*
class newGroupPage3 extends StatefulWidget {
  const newGroupPage3({super.key});

  @override
  State<newGroupPage3> createState() => _newGroupPage3State();
}

class _newGroupPage3State extends State<newGroupPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [ 
          Container(
            width: width,
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.all(60)),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Text(
                    "Choose the default payment method",
                    style: TextStyle(
                      fontFamily: "impact",
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
                      fontFamily: "impact",
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
                        title: Text(option.label, style: 
                        TextStyle(
                          fontSize: 25, fontFamily: 'impact'
                        ),),
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
              ],
            ),
          ),
          Positioned(
            bottom: 25,
            right: 20,
            child: ElevatedButton(
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
              onPressed: () {
                if (_selectedValue != -1) {
                  setState(() 
                  {
                    int r = Random().nextInt(imageStrings.length);
                    if (TitleController.text != "") {
                      groupContainer g = groupContainer(
                        imageGroup: imageStrings[r],
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
                  }
                  );
                  groupParticipants = [];
                  TitleController.text = "";
                  _selectedValue = -1;
                  Navigator.of(context).push(_createDownRoute());
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(40, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),
                ),
                backgroundColor: Colors.black,
              )
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: ElevatedButton(
              child: Icon(Icons.arrow_back_rounded, size: 30, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(60, 60),
                shape: CircleBorder(),
                backgroundColor: Colors.black,
              )
            ),
          ),
        ]
      )
    );
  }
}*/

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
/*
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
}*/

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
          print(val);
          print(this.name);
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
