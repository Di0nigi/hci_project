import 'package:flutter/material.dart';
import 'package:hci_project/main.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class newGroupPage extends StatefulWidget {
  const newGroupPage({super.key});

  @override
  State<newGroupPage> createState() => _newGroupPageState();
}
final Controller = TextEditingController();

class _newGroupPageState extends State<newGroupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column( crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Padding(padding: EdgeInsets.all(20)),
          Container(
            width: width,
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Text("Create a new Group", style: TextStyle(
              fontFamily: "impact",
              fontSize: 45,
              color: Colors.black,
              fontWeight: FontWeight.w100,
            ),),
          ),
          Padding(padding: EdgeInsets.all(65)),
          Container(
             padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
            child: Text("Choose a new name for the group", style: TextStyle(
              fontFamily: "impact",
              fontSize: 20,
              color: Color.fromARGB(197, 0, 0, 0),

            ),),
          
            


          ),
          Padding(padding: EdgeInsets.all(5)),
          Container(
            padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
            
            width: width-50,
            color: const Color.fromARGB(0, 255, 193, 7),
            child:TextField(
              style:TextStyle(
              fontFamily: "impact",
              fontSize: 15,
              color: Color.fromARGB(83, 0, 0, 0),
              letterSpacing: 1

            ) ,
              
                    controller: Controller,
                    decoration: InputDecoration(
                      
                      border:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    
                    
    ),
                      labelText: 'Name of your group',
                    ),
                  ), 
          ),
          Container(
            width: 70,
            height: 40,
            child: ElevatedButton(
                    child: Align(
                        alignment: Alignment.center, child: Icon(Icons.arrow_forward_rounded)),
                        style: ButtonStyle(
                      iconSize: MaterialStateProperty.all(25),
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
                        
                    onPressed: () {},
                    
                    ),

          )
          
        ]),








      ),
    );
  }
}
