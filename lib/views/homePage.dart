import 'package:flutter/material.dart';
import 'package:hci_project/main.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:hci_project/views/groupPage.dart';
import 'package:hci_project/views/newGroupPage.dart';
import 'package:hci_project/views/notificationPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String walletIcon = "assets/walletIcon.png";
String userIcon = "assets/userIcon.png";
String arrowIcon = "assets/arrowIcon.png";
Widget groupView = updateview();
int groups = 0;
List<groupContainer> groupsList = [
  groupContainer(title: "India trip", numMembers: 4, amount: 235)
];
List<groupInfo> groupsInfo = [
  groupInfo(groupName: "India trip", partecipants: ["Annalaura", "Dionigi", "Giordano", "Emanuele"])
];
newGroupPage newGP = newGroupPage();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Color.fromARGB(0, 255, 255, 255)),
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Container(
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
                  }),
            ],
          ),
        ),
        Container(
          width: width - 30,
          height: height - (height / 11) - (height / 10),
          color: Color.fromARGB(0, 255, 255, 255),
          child: Center(
            child: groupView,
          ),
        ),
        Container(
          width: width,
          height: height / 10,
          color: Color.fromARGB(0, 255, 255, 255),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(0, 255, 255, 255),
                      boxShadow: [
                        /*BoxShadow(color: Color.fromARGB(73, 208, 208, 208), blurRadius: 10, spreadRadius: 0.01)*/
                      ],
                      image: DecorationImage(
                        image: AssetImage(walletIcon),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 20, 10),
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: ElevatedButton(
                    child: Align(
                        alignment: Alignment.center, child: Icon(Icons.add)),
                    onPressed: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return Scaffold(
                              body: newGP,
                            );
                          });
                    },
                    style: ButtonStyle(
                      iconSize: MaterialStateProperty.all(40),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(10)),
                      alignment: Alignment.center,
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 0, 0, 0)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    ));
  }
}

Widget updateview() {
  return ListView.builder(
    itemCount: groupsList.length, // Replace with your data list length
    itemBuilder: (BuildContext context, int index) {
      //print(index);
      return groupsList[index];
    },
  );
}

class groupContainer extends StatelessWidget {
  final String title;
  final int numMembers;
  final int amount;

  groupContainer(
      {required this.title, required this.numMembers, required this.amount});

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
                Column(
                  children: [
                    Text(
                      this.title,
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontFamily: 'impact',
                          fontSize: 35),
                    ),
                    Padding(padding: EdgeInsets.all(2)),
                    Row(
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
                    )
                  ],
                ),
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
      groupName: titlePage, gInfo: groupsInfo,
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
