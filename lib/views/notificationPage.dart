import 'package:flutter/material.dart';
import 'package:hci_project/main.dart';

class notificationPage extends StatefulWidget {
  const notificationPage({super.key});

  @override
  State<notificationPage> createState() => _notificationPageState();
}

class _notificationPageState extends State<notificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [ 
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
                      fontFamily: "Roboto",
                      fontSize: 35,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ), 
                  ), 
                )
              ],
            )
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
        ]
      )
    );
  }
}






