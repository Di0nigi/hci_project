import 'package:flutter/material.dart';
import 'package:hci_project/main.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}
  String walletIcon= "assets\\walletIcon.png";
  
class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        Container(
          width: width,
          height: height/11,
          color: Color.fromARGB(0, 0, 0, 0),
          child: Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [IconButton(
                    iconSize: 40.0,
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    // Use the FluentIcons + name of the icon you want
                    icon: Icon(FluentIcons.alert_16_filled),
                    onPressed: () {
                      print("Button pressed");
                    }),],),


        ),
        Container(
          width: width,
          height: height-2*(height/11),
          color: Color.fromARGB(255, 255, 0, 0),
          child: ,

        ),
        Container(
          width: width,
          height: height/11,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0),child:Container(
                width: 45,
                height: 45,
                
                decoration: BoxDecoration(
                  color: Color.fromARGB(0, 255, 255, 255),
                  boxShadow: [/*BoxShadow(color: Color.fromARGB(73, 208, 208, 208), blurRadius: 10, spreadRadius: 0.01)*/],
                
                  image: DecorationImage(
                  image: AssetImage(walletIcon),
                  fit: BoxFit.scaleDown,
                ),
                ),
                
              )),
              
              Padding(padding:  EdgeInsets.fromLTRB(0, 10, 10, 10),
              child:
              SizedBox(
                width: 45,
                height: 45,
                child:ElevatedButton(
                
                child: Align(alignment: Alignment.center, child: Icon(Icons.add)),
                
                onPressed: () {
                  print("Aio");
                },
                style: ButtonStyle(
                  iconSize: MaterialStateProperty.all(25),
                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                  alignment: Alignment.center,
                 
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color.fromARGB(255, 169, 169, 169)),
                  shape:MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.5),
              ),
            ),
                ),
              ) ,)
              ,)
              
            ],
          ),
        )
      ]),
    ));
  }
}
