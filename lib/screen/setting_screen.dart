import 'package:flutter/material.dart';
import 'package:list_app/language/language_class.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, LanguageDefalt language, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.brown,
            title: Text(
              language.langeage_List['setting'].toString(),
              style: TextStyle(fontSize: 24),
            ),
          ),
          body: Container(
            color: Colors.yellowAccent.shade100,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [
                      Text("Language Setting", style: TextStyle(fontSize: 20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // ignore: prefer_const_constructors
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.greenAccent),
                                onPressed: () {
                                  var language = Provider.of<LanguageDefalt>(
                                      context,
                                      listen: false);
                                  language.EN();
                                },
                                child: Container(
                                  child: Text(
                                    "EN",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.greenAccent),
                                onPressed: () {
                                  var language = Provider.of<LanguageDefalt>(
                                      context,
                                      listen: false);
                                  language.JP();
                                },
                                child: Container(
                                  child: Text(
                                    "日本",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.greenAccent),
                                onPressed: () {
                                  setState(() {
                                    var language = Provider.of<LanguageDefalt>(
                                        context,
                                        listen: false);
                                    language.TH();
                                  });
                                },
                                child: Container(
                                  child: Text(
                                    "ไทย",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: 100,
                ),
                Container(
                  child: Column(
                    children: [Text("Yamakawa Hakata")],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
