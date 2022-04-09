// ignore: file_names
// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class ShowData_Screen extends StatefulWidget {
  const ShowData_Screen(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.date})
      : super(key: key);
  final String title;
  final String subtitle;
  final String date;

  @override
  _ShowData_ScreenState createState() => _ShowData_ScreenState();
}

class _ShowData_ScreenState extends State<ShowData_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(backgroundColor: Colors.brown, title: Text(widget.title)),
        body: Container(
          color: Colors.yellowAccent.shade100,
          padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 14),
          child: Column(
            
            children: [
              Expanded(
                  child: ListView(
                children: [
                  Container(
                    color: Colors.greenAccent.shade200,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      widget.subtitle,
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              )),
              SizedBox(height: 8,),
              SizedBox(
                child: Container(
                  
                  child: Text(widget.date, style: TextStyle(fontSize: 14),),
                ),
              )
            ],
          ),
        ));
  }
}
