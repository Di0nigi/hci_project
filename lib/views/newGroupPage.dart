import 'package:flutter/material.dart';
import 'package:hci_project/main.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class newGroupPage extends StatefulWidget {
  const newGroupPage({super.key});

  @override
  State<newGroupPage> createState() => _newGroupPageState();
}

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
Widget nameList = buildNameList();
final Controller = TextEditingController();

class _newGroupPageState extends State<newGroupPage> {
  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < contactList.length; i++) {
      bool f = false;
      contactBool.add(f);
    }
    return Scaffold(
      body: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(padding: EdgeInsets.all(20)),
          Container(
              width: 122,
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
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 255, 255),
                            letterSpacing: 1),
                      ),
                      Icon(Icons.close_rounded)
                    ],
                  ), /*child: */
                ),
                style: ButtonStyle(
                  //iconSize: MaterialStateProperty.all(25),
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                  alignment: Alignment.center,
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 0, 0, 0)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
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
                  color: Color.fromARGB(83, 0, 0, 0),
                  letterSpacing: 1),
              controller: Controller,
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
              width: 150,
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
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 255, 255),
                            letterSpacing: 1),
                      ),
                      Icon(Icons.arrow_forward_rounded)
                    ],
                  ),
                ),
                style: ButtonStyle(
                  //iconSize: MaterialStateProperty.all(25),
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                  alignment: Alignment.center,
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 0, 0, 0)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
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
                width: 122,
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
                              fontSize: 20,
                              color: Color.fromARGB(255, 255, 255, 255),
                              letterSpacing: 1),
                        ),
                      ],
                    ), /*child: */
                  ),
                  style: ButtonStyle(
                    //iconSize: MaterialStateProperty.all(25),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(10)),
                    alignment: Alignment.center,
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 0, 0, 0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
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
                    color: Color.fromARGB(83, 0, 0, 0),
                    letterSpacing: 1),
                controller: Controller,
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
                height: height - 300,
                child: nameList)
          ],
        ),
      ),
    );
  }
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

Widget buildNameList() {
  return ListView.builder(
    itemCount: contactList.length, // Replace with your data list length
    itemBuilder: (BuildContext context, int index) {
      return Container(
          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
          width: width - 50,
          height: 50,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(contactList[index]),
            Checkbox(
              value: contactBool[index],
               onChanged: (bool? value ) {
                 
                
        }
            ),
          ]));
    },
  );
}


