import 'package:annimation_assignment/src/presentation/ui/assignment%202.dart';
import 'package:annimation_assignment/src/presentation/ui/assignment_3.dart';
import 'package:flutter/material.dart';
import 'login_screen/login_screen.dart';

class AssignmentSelection extends StatefulWidget{
  @override
  State<AssignmentSelection> createState() => _AssignmentSelectionState();
}

class _AssignmentSelectionState extends State<AssignmentSelection> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
          }, child: Text("Assignment 1")
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Assignment2()));
          }, child:Text("Assignment 2") ),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Assignment3()));
          }, child:Text("Assignment 3") )

        ],
      ),
    ),
  );
  }
}