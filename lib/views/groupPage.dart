import 'package:flutter/material.dart';
import 'package:hci_project/main.dart';
import 'package:hci_project/views/expensePage.dart';
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
  expenseInfo(members: ["Annalaura", "Francesco"], groupName: "India trip", expenseName: "thai dinner"),
   
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
    newExpensePage newExp = newExpensePage(title: groupnameNow);
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(20)),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                ),
              )
            ]),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              height: height / 15,
              child: Text(
                groupnameNow,
                style: TextStyle(
                    fontFamily: "impact",
                    fontSize: 40,
                    color: Color.fromARGB(255, 0, 0, 0),
                    letterSpacing: 1),
              ),
            ),
            Container(
              color: Color.fromARGB(0, 0, 0, 0),
              width: width - 35,
              height: height - (height / 11) - (height / 10) - (height / 15),
              child: expensesView,
            ),
            Container(
              width: width,
              height: height / 11,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 75,
                    height: 75,
                    child: ElevatedButton(
                      child: Align(
                          alignment: Alignment.center, child: Icon(Icons.add)),
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
                      style: ButtonStyle(
                        iconSize: MaterialStateProperty.all(40),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(10)),
                        alignment: Alignment.center,
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 0, 0, 0)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget updateExpenseview() {
  return ListView.builder(
    itemCount: expenseList.length, // Replace with your data list length
    itemBuilder: (BuildContext context, int index) {
      //print(index);
      if (expenseList[index].group == groupnameNow) {
        print(expenseList[index].group);
        return expenseList[index];
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
  final int totalAmount;
  final int yourAmount;

  final String group;

  expenseContainer(
      {required this.title,
      required this.date,
      required this.author,
      required this.totalAmount,
      required this.yourAmount,
      required this.group});

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
                    Text(
                      this.title,
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'impact',
                          fontSize: 30),
                    ),
                    Text(
                      this.date,
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'impact',
                          fontSize: 15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "payed by ${this.author}",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'impact',
                              fontSize: 15),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
