import 'package:flutter/material.dart';
import 'package:hci_project/main.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:hci_project/views/groupPage.dart';
import 'package:hci_project/views/newGroupPage.dart';
import 'package:hci_project/views/notificationPage.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<String> imageStrings = [
  "assets\\groupsIcons\\Midjourney-.jpg",
  "assets\\groupsIcons\\Midjourney-9.jpg",
  "assets\\groupsIcons\\Nikio_a_wide_shot_of_a_giant_forgotten_pyramid_in_a_endless_des_be46ac84-f2cc-4034-9f34-d8d7a5cf9efc.png",
  "assets\\groupsIcons\\Operation_Upshot-Knothole_-_Badger_001.jpg",
  "assets\\groupsIcons\\starry-sky-4.jpg"
];

String walletIcon = "assets\\walletIcon.png";
String userIcon = "assets\\userIcon.png";
String arrowIcon = "assets\\arrowIcon.png";
Widget groupView = updateview();
int groups = 0;
List<groupContainer> groupsList = [
  groupContainer(title: "India trip", numMembers: 4, amount: 235, imageGroup: imageStrings[0],)
];
List<groupInfo> groupsInfo = [
  groupInfo(
      groupName: "India trip",
      partecipants: ["Annalaura", "Dionigi", "Giordano", "Emanuele", "You"])
];
newGroupPage newGP = newGroupPage();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack (
        children: [ 
          Container(
            decoration: BoxDecoration(color: Color.fromARGB(0, 255, 255, 255)),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end, 
              children: [
                Padding(padding: EdgeInsets.all(10)),
                Container(
                  width: width,
                  height: height / 17,
                  padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                  color: Color.fromARGB(0, 255, 0, 0),
                  child: Text(
                    "My groups",
                    style: TextStyle(fontFamily: "impact", fontSize: 30),
                  ),
                ),
                Padding(padding: EdgeInsets.all(15)),
                Container(
                  width: width - 30,
                  height: height - (height / 11) - (height / 10) - height / 17,
                  color: Color.fromARGB(0, 255, 255, 255),
                  child: Center(
                    child: groupView,
                  ),
                ),
                
              ]
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: width,
              height: height / 11,
              color: Color.fromARGB(0, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      iconSize: 40.0,
                      padding: EdgeInsets.fromLTRB(0, 25, 10, 0),
                      // Use the FluentIcons + name of the icon you want
                      icon: Icon(FluentIcons.alert_16_filled),
                      onPressed: () {
                        Navigator.of(context).push(_createNotificatioRoute());
                      }
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              child: Icon(Icons.add, size: 30, color: Colors.white),
              onPressed: () {
                showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return Scaffold(
                            body: newGP,
                          );
                        }
                );
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
}

Widget updateview() {
  List<groupContainer> revGroups = groupsList.reversed.toList();
  return ListView.builder(
    itemCount: revGroups.length, // Replace with your data list length
    itemBuilder: (BuildContext context, int index) {
      //print(index);

      return revGroups[index];
    },
  );
}

class groupContainer extends StatelessWidget {
  final String title;
  final int numMembers;
  final int amount;
  final String imageGroup;

  groupContainer(
      {required this.title,
      required this.numMembers,
      required this.amount,
      required this.imageGroup,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Container(
            height: 109,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 153, 0, 255),
                border: Border.all(width: 0),
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width/1.3,
                  color: const Color.fromARGB(0, 255, 193, 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: width/6,
                                                height: width/6,
                        
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                              
                              fit: BoxFit.cover,
                                image: AssetImage(this.imageGroup))),
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Text(
                        this.title,
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontFamily: 'impact',
                            fontSize: 35),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(2)),
                /*Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          this.numMembers.toString(),
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'impact',
                              fontSize: 30),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(userIcon))),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(50, 0, 0, 0)),
                        Text(
                          this.amount.toString(),
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'impact',
                              fontSize: 30),
                        ),
                      ],
                    )*/

                Container(
                  width: 30,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(arrowIcon), fit: BoxFit.fitWidth)),
                )
              ],
            ),
          )),
      onTap: () {
        Navigator.of(context).push(_createGroupRoute(this.title));
      },
    );
  }
}

Route _createNotificatioRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const notificationPage(),
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

Route _createGroupRoute(String titlePage) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => groupPage(
      groupName: titlePage,
      gInfo: groupsInfo,
    ),
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
