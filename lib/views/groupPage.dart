import 'package:flutter/material.dart';
import 'package:hci_project/main.dart';
import 'package:hci_project/views/expensePage.dart';
import 'package:hci_project/views/homePage.dart';
import 'package:hci_project/views/newExpensePage.dart';

class groupPage extends StatefulWidget {
  final String groupName;
  final List<groupInfo> gInfo;
  const groupPage({super.key, required this.groupName, required this.gInfo});

  @override
  State<groupPage> createState() =>
      _groupPageState(groupName: groupName, gInfo: this.gInfo);
}

String arrowIcon = "assets\\arrowIcon.png";

List<expenseContainer> expenseList = [
  expenseContainer(
    title: "thai dinner",
    date: "20/2/24",
    author: "Billy",
    totalAmount: 25,
    yourAmount: 5,
    group: "India trip",
  )
];
List<expenseInfo> expensesInfo = [
  expenseInfo(
    members: ["Annalaura", "Giordano", "You"],
    groupName: "India trip",
    expenseName: "thai dinner",
    author: "Billy",
  ),
];

String groupnameNow = "";

Widget expensesView = updateExpenseview();

class _groupPageState extends State<groupPage> {
  final List<groupInfo> gInfo;
  final String groupName;

  _groupPageState({required this.groupName, required this.gInfo}) {
    groupnameNow = groupName;
  }

  @override
  Widget build(BuildContext context) {
    List<String> nameList = [];
    String nameString = "";
    for (int i = 0; i < gInfo.length; i++) {
      if (gInfo[i].groupName == groupnameNow) {
        nameList = gInfo[i].partecipants;
      }
      ;
    }
    ;
    for (int i = 0; i < nameList.length; i++) {
      nameString = nameString + "${nameList[i]}" + ",";
    }
    ;
    nameString = nameString.substring(0, nameString.length - 1);
    newExpensePage newExp = newExpensePage(title: groupnameNow);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(50)),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    height: height / 9,
                    child: Column(children: [
                      Text(
                        groupnameNow,
                        style: TextStyle(
                            fontFamily: "impact",
                            fontSize: 40,
                            color: Color.fromARGB(255, 0, 0, 0),
                            letterSpacing: 1),
                      ),
                      Text(
                        nameString,
                        style: TextStyle(
                            fontFamily: 'impact',
                            fontSize: 10,
                            color: Color.fromARGB(137, 0, 0, 0)),
                      ),
                    ])),
                Container(
                  color: Color.fromARGB(0, 0, 0, 0),
                  width: width - 35,
                  height:
                      height - (height / 11) - (height / 10) - (height / 15),
                  child: expensesView,
                ),
              ],
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
                          body: newExp,
                        );
                      });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(70, 70),
                  shape: CircleBorder(),
                  backgroundColor: Colors.black,
                )),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: ElevatedButton(
                child: Icon(Icons.arrow_back_rounded, color: Colors.white,),
                onPressed: () {
                  Navigator.of(context).push(_createHomeRoute());
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(40, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  backgroundColor: Colors.black,
                )),
          ),
        ],
      ),
    );
  }
}

Widget updateExpenseview() {
  List<expenseContainer> revExp = expenseList.reversed.toList();
  return ListView.builder(
    itemCount: revExp.length, // Replace with your data list length
    itemBuilder: (BuildContext context, int index) {
      //print(index);
      if (revExp[index].group == groupnameNow) {
        for (int i = 0; i < expensesInfo.length; i++) {
          var e = expensesInfo[i];
          if (e.expenseName == revExp[index].title &&
              e.groupName == revExp[index].group &&
              e.author == revExp[index].author) {
            revExp[index].visibility = e.rejected;
            //print(revExp[index].visibility);
            print("non capisco");
          }
        }
        print(revExp[index].group);
        return revExp[index];
      } else {
        return Container();
      }
    },
  );
}

class expenseContainer extends StatelessWidget {
  final String title;
  final String date;
  final String author;
  final double totalAmount;
  final double yourAmount;
  bool visibility = false;

  final String group;

  expenseContainer({
    required this.title,
    required this.date,
    required this.author,
    required this.totalAmount,
    required this.yourAmount,
    required this.group,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
                color: Color.fromARGB(0, 255, 0, 0),
                border: Border.all(width: 3),
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${this.author}",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'impact',
                              fontSize: 15),
                        ),
                      ],
                    ),
                    Text(
                      this.title,
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'impact',
                          fontSize: 30),
                    ),
                    Visibility(
                        visible: this.visibility,
                        child: Icon(
                          icons[1].icon,
                          color: icons[1].color,
                        ))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(padding: EdgeInsets.all(4)),
                    Text(
                      this.totalAmount.toString(),
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'impact',
                          fontSize: 25),
                    ),
                    Padding(padding: EdgeInsets.all(7)),
                    Text(
                      "you payed ${this.yourAmount.toString()}",
                      style: TextStyle(
                          color: Color.fromARGB(255, 106, 106, 106),
                          fontFamily: 'impact',
                          fontSize: 15),
                    ),
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
        Navigator.of(context).push(_createExpenseRoute(
            this.title, this.date, this.totalAmount.toString(), this.author));
      },
    );
  }
}

Route _createExpenseRoute(
    String title, String date, String amount, String author) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => expensePage(
      title: title,
      date: date,
      amount: amount,
      author: author,
      exInfo: expensesInfo,
      group: groupnameNow,
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

class groupInfo {
  final List<String> partecipants;
  final String groupName;
  groupInfo({required this.groupName, required this.partecipants});
}

Route _createHomeRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0);
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
