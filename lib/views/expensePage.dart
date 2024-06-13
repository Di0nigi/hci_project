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
List<bool?> isChecked = [];

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
        isChecked = List.generate(expense[i].members.length, (index) => false);
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
          crossAxisAlignment: CrossAxisAlignment.center,
  
          children: [ 
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 173, 52),
                borderRadius: BorderRadius.only(topLeft: Radius.zero, topRight: Radius.zero, bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10) )),
              child: Column(children: [
               Padding(padding: EdgeInsets.all(20)),
            Row( mainAxisAlignment: MainAxisAlignment.start,
              children :[  
                          Container(
              color: Color.fromARGB(0, 0, 173, 52),
                width: 70,
                height: 40,
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: ElevatedButton(
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                        ),
                        
                      ],
                    ), /*child: */
                  ),
                  style: ButtonStyle(
                    // iconSize: MaterialStateProperty.all(25),
                    // padding: MaterialStateProperty.all<EdgeInsets>(
                    //     EdgeInsets.all(6)),
                    // alignment: Alignment.centerLeft,
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
                )),]),
            Padding(padding: EdgeInsets.all(20)),
            Container(
              
              width: width,
              height: height - height / 2 - height / 3.5,
              
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    this.title, // prova
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
                  Padding(padding: EdgeInsets.all(2)),
                  Text(
                    "${this.amount}€",
                    style: TextStyle(
                        fontFamily: "impact",
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  )
                ],
              ),
            ),])),
            Padding(padding: EdgeInsets.all(5)),
            Container(
              width: width-50,
              height: height / 11,
               decoration: BoxDecoration(
                color: Color.fromARGB(115, 214, 255, 209), borderRadius: BorderRadius.only(bottomLeft: Radius.zero, bottomRight: Radius.zero, topLeft: Radius.circular(10), topRight: Radius.circular(10))),
              
              child:Container(

                height: height / 11,
                width: width - 50,
                color: Color.fromARGB(0, 255, 0, 0),
                padding: EdgeInsets.fromLTRB(50, 0, 25, 0),
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
                )), ),
           
            
            Container(

              padding: EdgeInsets.fromLTRB(90, 0, 50, 0),
              width: width - 50,
              height: height -
                  (height - height / 2 - height / 3.5) -
                  height / 3 -
                  height / 13,
              decoration: BoxDecoration(color:Color.fromARGB(115, 214, 255, 209), borderRadius: BorderRadius.only(bottomLeft: Radius.zero, bottomRight: Radius.zero, topLeft: Radius.circular(10), topRight: Radius.circular(10))),
              
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
                          Icon(
                            Icons.timer,
                            color: Color.fromARGB(255, 255, 174, 0),
                          ),
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
                          openDialog();
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

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            "Do you want to reject the expense?",
            style: TextStyle(
              fontFamily: "impact",
              fontSize: 25,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          actions: [
            Row(children: [
              TextButton(
                onPressed: () {},
                child: Container(
                    width: 130,
                    height: 40,
                    // padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: ElevatedButton(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            fontFamily: "impact",
                            fontSize: 15,
                            color: Color.fromARGB(255, 0, 0, 0),
                            letterSpacing: 1),
                      ),
                      style: ButtonStyle(
                        shadowColor:  MaterialStateProperty.all<Color>(
                            Color.fromARGB(0, 32, 172, 0)), 
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(0, 32, 172, 0)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ))),
                
            TextButton(
                onPressed: () {},
                child: Container(
                    width: 130,
                    height: 40,
                    // padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: ElevatedButton(
                      child: Text(
                        "Reject",
                        style: TextStyle(
                            fontFamily: "impact",
                            fontSize: 15,
                            color: Color.fromARGB(255, 0, 0, 0),
                            letterSpacing: 1),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 178, 49, 49)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ))),],)
            
          ],
        ),
      );
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
