import 'package:flutter/material.dart';

class Assignment2 extends StatefulWidget {
  const Assignment2({super.key});

  @override
  Assignment2State createState() => Assignment2State();
}

class Assignment2State extends State<Assignment2> with WidgetsBindingObserver {
  Color containerColor = Colors.green;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() {
        containerColor = Colors.blue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Assignment 2'),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: containerColor,
          child:const Center(
            child: Text(
              'Container',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}