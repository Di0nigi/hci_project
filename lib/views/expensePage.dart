import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hci_project/main.dart';
import 'package:hci_project/views/groupPage.dart';
import 'package:hci_project/views/homePage.dart';

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

List<bool> boolExpenses = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false
];
expenseInfo nowExpense =
    expenseInfo(members: [""], groupName: "", expenseName: "", author: "");

List<rejStatus> icons = [
  rejStatus(icon: Icons.timer, color: Color.fromARGB(255, 242, 202, 0)),
  rejStatus(
      icon: Icons.cancel_rounded, color: Color.fromARGB(255, 178, 49, 49)),
  rejStatus(icon: Icons.check_circle, color: Color.fromARGB(255, 40, 198, 0))
];
String currentOnwner = "";
String expenseNameNow = "";
String groupNameNowInd = "";

bool ismine = false;
bool isRejected = false;

List<textDec> textdecorations = [];
List<memberInfo> membersList = [];
List<memberInfo> membersInfo = [
  memberInfo(
      name: "Annalaura",
      status: icons[1],
      rej: true,
      group: "India trip",
      expense: "thai dinner"),
  memberInfo(
      name: "Giordano",
      status: icons[0],
      rej: false,
      group: "India trip",
      expense: "thai dinner"),
  memberInfo(
      name: "You",
      status: icons[0],
      rej: false,
      group: "India trip",
      expense: "thai dinner"),
  memberInfo(
      name: "Annalaura",
      status: icons[0],
      rej: false,
      group: "Uni bros",
      expense: "Coffe"),
  memberInfo(
      name: "Emanuele",
      status: icons[1],
      rej: true,
      group: "Uni bros",
      expense: "Coffe"),
  memberInfo(
      name: "Kilian",
      status: icons[0],
      rej: false,
      group: "Uni bros",
      expense: "Coffe"),
  memberInfo(
      name: "You",
      status: icons[0],
      rej: false,
      group: "Uni bros",
      expense: "Coffe"),
  memberInfo(
      name: "Mark",
      status: icons[1],
      rej: true,
      group: "Rent & bills",
      expense: "Rent"),
  memberInfo(
      name: "Dionigi",
      status: icons[0],
      rej: false,
      group: "Rent & bills",
      expense: "Rent"),
  memberInfo(
      name: "You",
      status: icons[0],
      rej: false,
      group: "Rent & bills",
      expense: "Rent"),
  memberInfo(
      name: "Annalaura",
      status: icons[0],
      rej: false,
      group: "India trip",
      expense: "Grand hotel"),
  memberInfo(
      name: "Bill",
      status: icons[1],
      rej: true,
      group: "India trip",
      expense: "Grand hotel"),
  memberInfo(
      name: "Giordano",
      status: icons[0],
      rej: false,
      group: "India trip",
      expense: "Grand hotel"),
  memberInfo(
      name: "You",
      status: icons[0],
      rej: false,
      group: "India trip",
      expense: "Grand hotel"),
  memberInfo(
      name: "Saad",
      status: icons[1],
      rej: true,
      group: "Rent & bills",
      expense: "Groceries"),
  memberInfo(
      name: "Kilian",
      status: icons[0],
      rej: false,
      group: "Rent & bills",
      expense: "Groceries"),
  memberInfo(
      name: "You",
      status: icons[0],
      rej: false,
      group: "Rent & bills",
      expense: "Groceries"),
  memberInfo(
      name: "Christian",
      status: icons[0],
      rej: false,
      group: "Work lunch",
      expense: "Bella italia"),
  memberInfo(
      name: "Jason",
      status: icons[1],
      rej: true,
      group: "Work lunch",
      expense: "Bella italia"),
  memberInfo(
      name: "Kevin",
      status: icons[0],
      rej: false,
      group: "Work lunch",
      expense: "Bella italia"),
  memberInfo(
      name: "Zoe",
      status: icons[0],
      rej: false,
      group: "Work lunch",
      expense: "Bella italia"),
  memberInfo(
      name: "You",
      status: icons[0],
      rej: false,
      group: "Work lunch",
      expense: "Bella italia"),
  memberInfo(
      name: "Mark",
      status: icons[0],
      rej: false,
      group: "Rent & bills",
      expense: "Ikea table"),
  memberInfo(
      name: "Kilian",
      status: icons[1],
      rej: true,
      group: "Rent & bills",
      expense: "Ikea table"),
  memberInfo(
      name: "You",
      status: icons[0],
      rej: false,
      group: "Rent & bills",
      expense: "Ikea table"),
  memberInfo(
      name: "Annalaura",
      status: icons[0],
      rej: false,
      group: "India trip",
      expense: "Blue Cafe"),
  memberInfo(
      name: "Dionigi",
      status: icons[1],
      rej: true,
      group: "India trip",
      expense: "Blue Cafe"),
  memberInfo(
      name: "Bill",
      status: icons[0],
      rej: false,
      group: "India trip",
      expense: "Blue Cafe"),
  memberInfo(
      name: "You",
      status: icons[0],
      rej: false,
      group: "India trip",
      expense: "Blue Cafe"),
  memberInfo(
      name: "Annalaura",
      status: icons[0],
      rej: false,
      group: "Uni bros",
      expense: "Calc 1 book"),
  memberInfo(
      name: "Emanuele",
      status: icons[1],
      rej: true,
      group: "Uni bros",
      expense: "Calc 1 book"),
  memberInfo(
      name: "Kilian",
      status: icons[0],
      rej: false,
      group: "Uni bros",
      expense: "Calc 1 book"),
  memberInfo(
      name: "You",
      status: icons[0],
      rej: false,
      group: "Uni bros",
      expense: "Calc 1 book"),
  memberInfo(
      name: "Christian",
      status: icons[0],
      rej: false,
      group: "Work lunch",
      expense: "Mario's"),
  memberInfo(
      name: "Kevin",
      status: icons[1],
      rej: true,
      group: "Work lunch",
      expense: "Mario's"),
  memberInfo(
      name: "You",
      status: icons[0],
      rej: false,
      group: "Work lunch",
      expense: "Mario's"),
];
List<bool?> isChecked = [];
//List<bool> expenseBool = [false,false,false,false,false,false,false,false,false,false,];

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
    currentOnwner = this.author;
    membersList = [];
    expenseNameNow = this.title;
    groupNameNowInd = this.group;

    for (int i = 0; i < expense.length; i++) {
      print(expense[i].groupName);
      print(expense[i].expenseName);
      print(" ");
      print(this.group);
      print(this.title);

      if (expense[i].expenseName == this.title &&
          expense[i].groupName == this.group) {
        print(expense[i].rejected);
        print("ao");
        expense[i].rejected = boolExpenses[i];
        //nowExpense = expense[i];
        //membersList = expense[i].members;
        for (int j = 0; j < membersInfo.length; j++) {
          if (membersInfo[j].group == expense[i].groupName &&
              membersInfo[j].expense == expense[i].expenseName) {
            membersList.add(membersInfo[j]);
          }
        }
        isChecked = List.generate(expense[i].members.length, (index) => false);
        if (expense[i].author == "You") {
          ismine = true;
        } else {
          ismine = false;
        }
        if (expense[i].rejected == true) {
          ismine = true;
        }
      }
    }
    return Scaffold(
        body: Stack(children: [
      Container(
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 173, 52),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        topRight: Radius.zero,
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Column(children: [
                  Padding(padding: EdgeInsets.all(50)),
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
                              fontFamily: "roboto",
                              fontSize: 50,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        Text(
                          this.date,
                          style: TextStyle(
                              fontFamily: "roboto",
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                        Padding(padding: EdgeInsets.all(2)),
                        Text(
                          "${this.amount}€",
                          style: TextStyle(
                              fontFamily: "roboto",
                              fontSize: 40,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                        Text(
                          "${(double.parse(this.amount)/membersList.length).toStringAsFixed(1)}€ each",
                          style: TextStyle(
                              fontFamily: "roboto",
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromARGB(172, 0, 0, 0)),
                        )
                      ],
                    ),
                  ),
                ])),
            Padding(padding: EdgeInsets.all(5)),
            Container(
              width: width - 50,
              height: height / 11,
              decoration: BoxDecoration(
                  color: Color.fromARGB(115, 214, 255, 209),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero,
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Container(
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
                            fontFamily: "roboto",
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "for:",
                            style: TextStyle(
                                fontFamily: "roboto",
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(90, 0, 50, 0),
              width: width - 50,
              height: height -
                  (height - height / 2 - height / 3.5) -
                  height / 3 -
                  height / 13,
              decoration: BoxDecoration(
                  color: Color.fromARGB(115, 214, 255, 209),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero,
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: ListView.builder(
                itemCount: membersList.length,
                itemBuilder: (BuildContext context, int index) {
                  textDec t = textDec();
                  if (membersList[index].rej == false) {
                    t.col = Colors.black;
                    t.dec = TextDecoration.none;
                  }
                  print(this.author);
                  return Visibility(
                      visible: !(membersList[index].name == "You" &&
                          this.author == "You"),
                      child: Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(membersList[index].name,
                                  style: TextStyle(
                                    decoration: t.dec,
                                    fontFamily: "roboto",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: t.col,
                                  )),
                              Icon(
                                membersList[index].status.icon,
                                color: membersList[index].status.color,
                              ),
                            ]),
                      ));
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
                          openDialog();
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Reject this expense",
                              style: TextStyle(
                                  fontFamily: "roboto",
                                  fontSize: 26,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)),
                            ),
                            Text(
                              "-3h 16min",
                              style: TextStyle(
                                  fontFamily: "roboto",
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
      Positioned(
        top: 50,
        left: 20,
        child: ElevatedButton(
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(40, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              backgroundColor: Colors.black,
            )),
      ),
    ]));
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Column(
            children: [
              Text(
                "Do you want to reject ${expenseNameNow}?",
                style: TextStyle(
                  fontFamily: "roboto",
                  fontSize: 25,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Text(
                "You will be refunded and ${currentOnwner} will be notified",
                style: TextStyle(
                  fontFamily: "roboto",
                  fontSize: 15,
                  color: Color.fromARGB(137, 0, 0, 0),
                ),
              )
            ],
          ),
          actions: [
            Row(
              children: [
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
                                fontFamily: "roboto",
                                fontSize: 15,
                                color: Color.fromARGB(255, 0, 0, 0),
                                letterSpacing: 1),
                          ),
                          style: ButtonStyle(
                            shadowColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(0, 32, 172, 0)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(0, 32, 172, 0)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
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
                                fontFamily: "roboto",
                                fontSize: 15,
                                color: Color.fromARGB(255, 0, 0, 0),
                                letterSpacing: 1),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 178, 49, 49)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              for (int y = 0; y < expense.length; y++) {
                                if (expense[y].expenseName == this.title &&
                                    expense[y].groupName == this.group) {
                                  boolExpenses[y] = true;
                                  print("sssssssssssssss");
                                }
                              }
                              //nowExpense.rejected = true;
                              //isRejected = true;
                              print("aoooo");
                              for (int x = 0; x < membersList.length; x++) {
                                if (membersList[x].name == "You" &&
                                    membersList[x].expense == expenseNameNow &&
                                    membersList[x].group == groupNameNowInd) {
                                  membersList[x].status = icons[1];
                                  membersList[x].rej = true;
                                  print(membersList[x].name);
                                }
                              }
                              Navigator.pop(context);
                              Navigator.of(context).push(_createGroupRoute());
                            });
                          },
                        ))),
              ],
            )
          ],
        ),
      );
}

class expenseInfo {
  final List<String> members;
  final String groupName;
  final String expenseName;
  final String author;
  bool rejected = false;
  expenseInfo({
    required this.members,
    required this.groupName,
    required this.expenseName,
    required this.author,
  });
}

Route _createGroupRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => groupPage(
      groupName: groupNameNowInd,
      gInfo: groupsInfo,
    ),
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

class rejStatus {
  final IconData icon;
  final Color color;
  rejStatus({required this.icon, required this.color});
}

class memberInfo {
  final String name;
  rejStatus status;
  bool rej;
  final String group;
  final String expense;

  memberInfo(
      {required this.name,
      required this.status,
      required this.rej,
      required this.group,
      required this.expense});
}

class textDec {
  var col = Color.fromARGB(110, 0, 0, 0);
  var dec = TextDecoration.lineThrough;
}
