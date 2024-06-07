import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hci_project/main.dart';

class expensePage extends StatefulWidget {
  final String title;
  final String date;
  final String amount;
  final String author;
  final List<expenseInfo> exInfo;
  final String group;

  const expensePage(
      {super.key,
      required this.title,
      required this.date,
      required this.amount,
      required this.author,
      required this.exInfo,
      required this.group});

  @override
  State<expensePage> createState() => _expensePageState(
      title: this.title,
      date: this.date,
      amount: this.amount,
      author: this.author,
      expense: this.exInfo,
      group: this.group);
}

bool ismine = false;

List<String> membersList = [];

class _expensePageState extends State<expensePage> {
  final String title;
  final String date;
  final String amount;
  final String author;
  final String group;
  final List<expenseInfo> expense;
  _expensePageState(
      {required this.title,
      required this.date,
      required this.amount,
      required this.author,
      required this.expense,
      required this.group});

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < expense.length; i++) {
      print(expense[i].groupName);
      print(expense[i].expenseName);
      print(" ");
      print(this.group);
      print(this.title);

      if (expense[i].expenseName == this.title &&
          expense[i].groupName == this.group) {
        print("ao");
        membersList = expense[i].members;
        if (expense[i].author == "you") {
          ismine = true;
        } else {
          ismine = false;
        }
      }
    }
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
              width: width,
              height: height - height / 2 - height / 3.5,
              color: Color.fromARGB(0, 255, 255, 255),
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    this.title,
                    style: TextStyle(
                        fontFamily: "impact",
                        fontSize: 50,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Text(
                    this.date,
                    style: TextStyle(
                        fontFamily: "impact",
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.black),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    "${this.amount}£",
                    style: TextStyle(
                        fontFamily: "impact",
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  )
                ],
              ),
            ),
            Container(
                height: height / 13,
                width: width - 50,
                color: Color.fromARGB(0, 255, 0, 0),
                padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "payed by ${this.author}",
                      style: TextStyle(
                          fontFamily: "impact",
                          fontSize: 25,
                          fontWeight: FontWeight.w100,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "for:",
                          style: TextStyle(
                              fontFamily: "impact",
                              fontSize: 25,
                              fontWeight: FontWeight.w100,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        Text(
                          "status",
                          style: TextStyle(
                              fontFamily: "impact",
                              fontSize: 21,
                              fontWeight: FontWeight.w100,
                              color: Color.fromARGB(168, 0, 0, 0)),
                        ),
                      ],
                    )
                  ],
                )),
            Container(
              padding: EdgeInsets.fromLTRB(90, 0, 0, 0),
              width: width - 70,
              height: height -
                  (height - height / 2 - height / 3.5) -
                  height / 3 -
                  height / 13,
              color: Color.fromARGB(0, 44, 79, 45),
              child: ListView.builder(
                itemCount: membersList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            membersList[index],
                            style: TextStyle(
                                fontFamily: "impact",
                                fontSize: 20,
                                fontWeight: FontWeight.w100,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          Icon(Icons.check_box)
                        ]),
                  );
                },
              ),
            ),
            Visibility(
                visible: !ismine,
                child: Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    width: width,
                    child: Center(
                        child: Container(
                      width: width - 70,
                      height: height / 8,
                      child: ElevatedButton(
                        onPressed: () {
                          print("rejected");
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Reject the expense",
                              style: TextStyle(
                                  fontFamily: "impact",
                                  fontSize: 26,
                                  fontWeight: FontWeight.w300,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)),
                            ),
                            Text(
                              "-3h 16min",
                              style: TextStyle(
                                  fontFamily: "impact",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)),
                            )
                          ],
                        ),
                        style: ButtonStyle(
                          //iconSize: MaterialStateProperty.all(25),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(10)),
                          alignment: Alignment.center,
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 178, 49, 49)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ))))
          ],
        ),
      ),
    );
  }
}

class expenseInfo {
  final List<String> members;
  final String groupName;
  final String expenseName;
  final String author;
  expenseInfo(
      {required this.members,
      required this.groupName,
      required this.expenseName,
      required this.author});
}
