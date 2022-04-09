// ignore_for_file: prefer_const_constructors
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:list_app/class_data/data_class.dart';
import 'package:list_app/provider/data_Provider.dart';
import 'package:list_app/screen/addFile_screen.dart';
import 'package:list_app/screen/key_screen.dart';
import 'package:list_app/screen/setting_screen.dart';
import 'package:list_app/screen/showData_screen.dart';
import 'package:provider/provider.dart';
import 'package:list_app/language/language_class.dart';

class OneScreen extends StatefulWidget {
  const OneScreen({Key? key}) : super(key: key);

  @override
  _OneScreenState createState() => _OneScreenState();
}

class _OneScreenState extends State<OneScreen> {
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
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SettingScreen();
                  }));
                },
                icon: Icon(Icons.settings)),
          ],
          title: Center(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // ignore: prefer_const_constructors
                Text("          "+
                  language.langeage_List['date']
                      .toString(), // name of bar page 1
                  style: TextStyle(fontSize: 28, color: Colors.white60),
                )
              ],
            ),
          ),
        ),
        body: Consumer(builder: (context, DataProvider provider, Widget) {
          
          List data = provider.getHead();

          if (provider.DataPro_list.length < 1) {
            return Center(
              child: Text(
                language.langeage_List['no_data'].toString(),
                style: TextStyle(fontSize: 25),
              ),
            );
          } else {
            return ListView.builder(
                itemCount: provider.DataPro_list.length,
                itemBuilder: (context, int index) {
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
                              return KeyScreen(keyData: data[index]);
                            }));
                          },
                          child: ListTile(
                            leading: Icon(Icons.date_range),
                            title: Text(
                              "${data[index]}",
                              style: TextStyle(fontSize: 20),
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
