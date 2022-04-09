// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:list_app/class_data/data_class.dart';
import 'package:list_app/provider/data_Provider.dart';
import 'package:list_app/screen/addFile_screen.dart';
import 'package:list_app/screen/setting_screen.dart';
import 'package:list_app/screen/showData_screen.dart';
import 'package:provider/provider.dart';
import 'package:list_app/language/language_class.dart';

class KeyScreen extends StatefulWidget {
  const KeyScreen({Key? key, required this.keyData}) : super(key: key);
  
  final String keyData;

  @override
  _KeyScreenState createState() => _KeyScreenState();
}

class _KeyScreenState extends State<KeyScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<DataProvider>(context, listen: false).initData();
    Provider.of<LanguageDefalt>(context, listen: false).initeLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, LanguageDefalt language, Widget? child) {
      return Scaffold(
        backgroundColor: Colors.yellowAccent.shade100,
        appBar: AppBar(
          backgroundColor: Colors.brown,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AddDataScreen();
                  }));
                },
                icon: Icon(Icons.add)),
            
          ],
          title: Center(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // ignore: prefer_const_constructors
                Text(
                  language.langeage_List['list']
                      .toString(), // name of bar page 1
                  style: TextStyle(fontSize: 28, color: Colors.white60),
                )
              ],
            ),
          ),
        ),
        body: Consumer(builder: (context, DataProvider provider, Widget) {

         
          
          
          if (provider.DataPro_list[widget.keyData] == null) {
            return Center(
              child: Text(
                language.langeage_List['no_data'].toString(),
                style: TextStyle(fontSize: 25),
              ),
            );
          } else {
            return ListView.builder(

                itemCount: provider.DataPro_list[widget.keyData]!.length,
                itemBuilder: (context, int index) {
                   var data1 = provider.DataPro_list[widget.keyData];
                   var data = data1![index];
                   print(data);
                  return Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 6),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.greenAccent),
                          onPressed: () {

                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ShowData_Screen(
                                title: data.title.toString(),
                                subtitle: data.subtitle.toString(),
                                date: data.date.toString(),
                              );

                            }));
                          },
                          child: ListTile(
                            leading: Icon(Icons.push_pin),
                            title: Text(
                              data.title.toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: Text(
                              data.date.toString()
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                });
          }
        }),
      );
    });
  }
}
