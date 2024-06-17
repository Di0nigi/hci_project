import 'package:flutter/material.dart';
import 'package:hci_project/main.dart';
import 'package:hci_project/views/expensePage.dart';
import 'package:hci_project/views/homePage.dart';
import 'package:hci_project/views/groupPage.dart';

class notificationPage extends StatefulWidget {
  const notificationPage({super.key});

  @override
  State<notificationPage> createState() => _notificationPageState();
}

List<bool> boolNotifications = [];
List<notificationContainer> notifications = [
  /* notificationContainer(
    groupTitle: "India trip",
    ownerExpense: "Billy",
    price: 40.0,
    yourAmount: 10.0,
    expenseTitle: "thai dinner",
    date: "3",
  )*/
];

class _notificationPageState extends State<notificationPage> {
  @override
  Widget build(BuildContext context) {
    boolNotifications = [];
    notifications = [];
    //to check the indeces
    for (int i = 0; i < expenseList.length; i++) {
      expenseContainer ex = expenseList[i];
      bool f = false;
      for (int j = 0; j < expensesInfo.length; j++) {
        expenseInfo e = expensesInfo[j];
        if (ex.title == e.expenseName &&
            ex.group == e.groupName &&
            e.author == ex.author) {
          f = e.rejected;

          print(i);
        }
      }

      if (ex.author != "You") {
        if (f == true) {
          boolNotifications.add(true);
          notificationContainer n = notificationContainer(
              groupTitle: ex.group,
              ownerExpense: ex.author,
              price: ex.totalAmount,
              yourAmount: ex.yourAmount,
              expenseTitle: ex.title,
              date: ex.date,
              isVisible: true);
          notifications.add(n);
        } else {
          boolNotifications.add(false);
          notificationContainer n = notificationContainer(
              groupTitle: ex.group,
              ownerExpense: ex.author,
              price: ex.totalAmount,
              yourAmount: ex.yourAmount,
              expenseTitle: ex.title,
              date: ex.date,
              isVisible: false);
          notifications.add(n);
        }
      }
    }
    return Scaffold(
        body: Stack(children: [
      Container(
        height: 200,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 173, 52),
            borderRadius: BorderRadius.only(
                topLeft: Radius.zero,
                topRight: Radius.zero,
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
      ),
      Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(60)),
          Container(
            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Text(
              "Notification",
              style: TextStyle(
                fontFamily: "impact",
                fontSize: 35,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(18)),
          Container(
            width: width,
            height: height - 200,
            color: Color.fromARGB(0, 255, 0, 0),
            child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (BuildContext context, int index) {
                  notifications[index].isVisible = boolNotifications[index];
                  return Container(child: notifications[index]);
                }),
          )
        ],
      )),
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
}

class notificationContainer extends StatelessWidget {
  final String groupTitle;
  final String expenseTitle;
  final String ownerExpense;
  final double price;
  final double yourAmount;
  final String date;
  bool isVisible = false;

  notificationContainer(
      {required this.groupTitle,
      required this.ownerExpense,
      required this.price,
      required this.yourAmount,
      required this.expenseTitle,
      required this.date,
      required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Visibility(
        visible: !this.isVisible,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
            decoration: BoxDecoration(
                color: Color.fromARGB(152, 181, 181, 181),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            height: height / 9,
            width: width - 100,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.groupTitle,
                    style: TextStyle(fontFamily: 'impact', fontSize: 25),
                  ),
                  Text(
                      '${this.ownerExpense} payed ${this.price}€ for "${this.expenseTitle}".',
                      style: TextStyle(fontFamily: 'impact', fontSize: 15)),
                  Text('You payed ${this.yourAmount}€',
                      style: TextStyle(fontFamily: 'impact', fontSize: 15)),
                  //Padding(padding: EdgeInsets.all(5)),
                  Text("click to see more details on the expense’s status",
                      style: TextStyle(
                          fontFamily: 'impact',
                          fontSize: 12,
                          color: Color.fromARGB(170, 0, 0, 0)))
                ]),
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(_createNotificationExpenseRoute(
            this.expenseTitle,
            this.date,
            this.price.toString(),
            this.ownerExpense,
            this.groupTitle));
      },
    );
  }
}

Route _createNotificationExpenseRoute(
    String title, String date, String amount, String author, groupName) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => expensePage(
      title: title,
      date: date,
      amount: amount,
      author: author,
      exInfo: expensesInfo,
      group: groupName,
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
