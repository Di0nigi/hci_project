import 'package:flutter/material.dart';
import 'package:hci_project/main.dart';
import 'package:hci_project/views/newExpensePage.dart';

class groupPage extends StatefulWidget {
  const groupPage({super.key});

  @override
  State<groupPage> createState() => _groupPageState();
}

String arrowIcon = "assets/arrowIcon.png";

List<expenseContainer> expenseList = [
  expenseContainer(title: "thai dinner", date: "20/2/24", author: "Billy", totalAmount: 25, yourAmount: 5)
];

Widget expensesView = updateExpenseview();

newExpensePage newExp = newExpensePage();

class _groupPageState extends State<groupPage> {
  @override
  Widget build(BuildContext context) {
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
              color: Color.fromARGB(0, 0, 0, 0),
              width: width,
              height: height - (height / 11) - (height / 10),
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
      return expenseList[index];
    },
  );
}

class expenseContainer extends StatelessWidget {
  final String title;
  final String date;
  final String author;
  final int totalAmount;
  final int yourAmount;

  expenseContainer(
      {required this.title,
      required this.date,
      required this.author,
      required this.totalAmount,
      required this.yourAmount});

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
            padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      this.title,
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'impact',
                          fontSize: 35),
                    ),
                    Padding(padding: EdgeInsets.all(2)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "payed by",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'impact',
                              fontSize: 30),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(50, 0, 0, 0)),
                        Text(
                          this.yourAmount.toString(),
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
        //Navigator.of(context).push(_createGroupRoute());
      },
    );
  }
}
