import 'package:flutter/material.dart';
import 'package:hci_project/main.dart';
import 'package:flutter/services.dart';
import 'package:hci_project/views/expensePage.dart';
import 'package:hci_project/views/groupPage.dart';
import 'package:hci_project/views/homePage.dart';
import 'dart:math';

class newExpensePage extends StatefulWidget {
  final String title;
  const newExpensePage({super.key, required this.title});

  @override
  State<newExpensePage> createState() => _newExpensePageState(title: title);
}

TextEditingController nameController = TextEditingController();
TextEditingController amountController = TextEditingController();
String _nameController = "";
String _amountController = "";

List<Option> lastTransaction = [
  Option(label: "Lunch, 25€", value: 1),
  Option(label: "Movie Tickets, 15€", value: 2),
  Option(label: "Chewing gums, 3€", value: 3),
  Option(label: "Car rental, 78€", value: 4)
];
int numpartecipants = 0;
List<bool> partecipantsBool = [];

List<String> partecipants = [];
List<String> expenseMembers = [];

int? _selectedValue = -1;
int? _selectedValue2 = 0;
String nowTitle = "";

class _newExpensePageState extends State<newExpensePage> {
  final String title;

  _newExpensePageState({required this.title}) {
    nowTitle = this.title;
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < groupsInfo.length; i++) {
      if (groupsInfo[i].groupName == this.title) {
        partecipants = groupsInfo[i].partecipants;
      }
      ;
    }
    for (int i = 0; i < partecipants.length; i++) {
      bool f = false;
      partecipantsBool.add(f);
    }
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(padding: EdgeInsets.all(20)),
          Container(
              width: 70,
              height: 40,
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: ElevatedButton(
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Icon(Icons.close_rounded)],
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
          Container(
            color: const Color.fromARGB(0, 33, 149, 243),
            width: width,
            height: height / 7,
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Create a new expense",
                    style: TextStyle(
                      fontFamily: "impact",
                      fontSize: 40,
                      color: Colors.black,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    "manually ad an expense",
                    style: TextStyle(
                        fontFamily: "impact",
                        fontSize: 20,
                        color: const Color.fromARGB(137, 0, 0, 0),
                        fontWeight: FontWeight.w400),
                  )
                ]),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
            width: width - 20,
            height: height / 8,
            color: Color.fromRGBO(212, 212, 212, 0),
            child: Column(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(fontFamily: 'impact', fontSize: 12),
                    controller: amountController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Amount',
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: TextField(
                    style: TextStyle(fontFamily: 'impact', fontSize: 12),
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name your expense',
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: width,
            height: height / 6,
            padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
            child: Column(
              children: [
                Text(
                  "or",
                  style: TextStyle(
                      fontFamily: "impact",
                      fontSize: 17,
                      color: Color.fromARGB(137, 0, 0, 0),
                      fontWeight: FontWeight.w300),
                ),
                Padding(padding: EdgeInsets.all(15)),
                Text(
                  "select from latest transactions",
                  style: TextStyle(
                      fontFamily: "impact",
                      fontSize: 20,
                      color: Color.fromARGB(137, 0, 0, 0),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Container(
            color: Color.fromARGB(0, 255, 0, 0),
            width: width,
            height:
                height - 40 - height / 8 - height / 8 - height / 6 - height / 5,
            child: ListView.builder(
              itemCount: lastTransaction.length,
              itemBuilder: (context, index) {
                final option = lastTransaction[index];
                return RadioListTile<int>(
                  title: Text(
                    option.label,
                    style: TextStyle(fontFamily: 'impact', fontSize: 20),
                  ),
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
          Container(
              width: width,
              height: height / 13,
              color: Color.fromARGB(0, 136, 130, 130),
              child: Align(
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
                              "Continue",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 19,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  letterSpacing: 1),
                            ),
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if ((amountController.text != "" &&
                                nameController.text != "") ||
                            _selectedValue != -1) {
                          _amountController = amountController.text;
                          _nameController = nameController.text;
                          Navigator.of(context).push(_createExpenseRoute2());
                        } else {
                          // TODO: warn user
                        }
                      },
                    ),
                  ))),
        ]),
      ),
    );
  }
}

// SECOND NEWEXPENSEPAGE

class newExpensePage2 extends StatefulWidget {
  const newExpensePage2({super.key});

  @override
  State<newExpensePage2> createState() => _newExpensePage2State();
}

class _newExpensePage2State extends State<newExpensePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(padding: EdgeInsets.all(20)),
          Container(
              width: 70,
              height: 40,
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: ElevatedButton(
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back_rounded),
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
          Container(
            width: width,
            height: height / 4,
            color: Color.fromARGB(0, 0, 255, 42),
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Create a new expense",
                    style: TextStyle(
                        fontFamily: "impact",
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Text(
                    " select the participants",
                    style: TextStyle(
                        fontFamily: "impact",
                        fontSize: 20,
                        color: Color.fromARGB(137, 0, 0, 0),
                        fontWeight: FontWeight.w300),
                  )
                ]),
          ),
          Container(
              color: Color.fromARGB(0, 255, 0, 0),
              width: width,
              height:
                  height - height / 8 - height / 4 - height / 13 - height / 15,
              child: ListView.builder(
                itemCount:
                    partecipants.length, // Replace with your data list length
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Container(
                          color: const Color.fromARGB(0, 121, 85, 72),
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          width: width - 50,
                          height: 30,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  partecipants[index],
                                  style: TextStyle(
                                      fontFamily: 'impact', fontSize: 25),
                                ),
                                customPartecipantCheckBox(
                                  val: partecipantsBool[index],
                                  title: partecipants[index],
                                )
                              ])));
                },
              )),
          Container(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
              color: Color.fromARGB(0, 255, 255, 255),
              width: width,
              height: height / 6,
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 110,
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
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  letterSpacing: 1),
                            ),
                            Icon(Icons.check_rounded)
                          ],
                        ),
                      ),
                      style: ButtonStyle(
                        //iconSize: MaterialStateProperty.all(25),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(10)),
                        alignment: Alignment.center,
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 0, 0, 0)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          if (_selectedValue! > -1) {
                            var s = lastTransaction[(_selectedValue! - 1)];
                            var ls = s.label.split(",");
                            var d = DateTime.now();
                            String price = "";
                            List<String> nums = [
                              "1",
                              "2",
                              "3",
                              "4",
                              "5",
                              "6",
                              "7",
                              "8",
                              "9",
                              "10"
                            ];
                            for (int j = 0; j < ls[1].length; j++) {
                              if (nums.contains(ls[1][j])) {
                                price = "${price}${ls[1][j]}";
                              }
                            }
                            expenseContainer eC = expenseContainer(
                                title: ls[0],
                                date:
                                    "${d.day.toString()}/${d.month.toString()}/${d.year.toString()}",
                                author: "you",
                                totalAmount: double.parse(price),
                                yourAmount: (double.parse(price) /
                                    (expenseMembers.length + 1)),
                                group: nowTitle);
                            expenseList.add(eC);

                            expenseInfo eF = expenseInfo(
                              members: expenseMembers,
                              groupName: nowTitle,
                              expenseName: ls[0],
                              author: "you",
                            );
                            expensesInfo.add(eF);
                            for (int i = 0; i < expenseMembers.length; i++) {
                              var rej = false;
                              int r = Random().nextInt(3);
                              if (r == 1) {
                                rej = true;
                              }
                              var mem = memberIfo(
                                  name: expenseMembers[i],
                                  group: nowTitle,
                                  expense:ls[0],
                                  status: icons[r],
                                  rej: rej);
                              membersInfo.add(mem);
                              print(mem);
                            }
                            _selectedValue = -1;
                          } else if (true) {
                            var d = DateTime.now();
                            String price = _amountController;
                            String name = _nameController;
                            expenseContainer eC = expenseContainer(
                                title: name,
                                date:
                                    "${d.day.toString()}/${d.month.toString()}/${d.year.toString()}",
                                author: "you",
                                totalAmount: double.parse(price),
                                yourAmount: (double.parse(price) /
                                    (expenseMembers.length + 1)),
                                group: nowTitle);
                            expenseList.add(eC);

                            expenseInfo eF = expenseInfo(
                              members: expenseMembers,
                              groupName: nowTitle,
                              expenseName: name,
                              author: "you",
                            );
                            expensesInfo.add(eF);
                            for (int i = 0; i < expenseMembers.length; i++) {
                              var rej = false;
                              int r = Random().nextInt(3);
                              if (r == 1) {
                                rej = true;
                              }
                              var mem = memberIfo(
                                  name: expenseMembers[i],
                                  group: nowTitle,
                                  expense: name,
                                  status: icons[r],
                                  rej: rej);
                              membersInfo.add(mem);
                              print(mem);
                            }
                          }
                          expensesView = updateExpenseview();

                          //expenseContainer eC =expenseContainer(title: , date: date, author: author, totalAmount: totalAmount, yourAmount: yourAmount, group: group)
                        });
                        expenseMembers = [];
                        nameController.text = "";
                        amountController.text = "";

                        Navigator.of(context).push(_createExpenseDownRoute());
                      },
                    ),
                  )))
        ]),
      ),
    );
  }
}

class Option {
  final String label;
  final int value;

  Option({required this.label, required this.value});
}

Route _createExpenseRoute2() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const newExpensePage2(),
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

Route _createExpenseDownRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => groupPage(
      groupName: groupnameNow,
      gInfo: groupsInfo,
    ),
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

class customPartecipantCheckBox extends StatefulWidget {
  final val;
  final String title;
  const customPartecipantCheckBox({super.key, this.val, required this.title});

  @override
  State<customPartecipantCheckBox> createState() =>
      customPartecipantCheckBoxState(val: this.val, title: title);
}

class customPartecipantCheckBoxState extends State<customPartecipantCheckBox> {
  var val = false;
  var title;

  customPartecipantCheckBoxState({required this.val, required this.title}) {}

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: val,
        onChanged: (bool? value) {
          if (val == false) {
            numpartecipants += 1;
            expenseMembers.add(title);
          }
          if (val == true) {
            numpartecipants -= 1;
            if (expenseMembers.contains(title)) {
              expenseMembers.remove(title);
            }
          }

          setState(() {
            val = value!;
          });

          print(val);
        });
  }
}
