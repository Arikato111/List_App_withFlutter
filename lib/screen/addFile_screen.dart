// ignore: file_names
// ignore_for_file: file_names, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:list_app/class_data/data_class.dart';
import 'package:list_app/language/language_class.dart';
import 'package:list_app/provider/data_Provider.dart';
import 'package:provider/provider.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({Key? key}) : super(key: key);

  @override
  _AddDataScreenState createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  final fromKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final subtitleContrallor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, LanguageDefalt language, Widget? child) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.brown,
              // ignore: prefer_const_constructors
              title: Text(
                "        ${language.langeage_List["add_data"]}",
                style: TextStyle(fontSize: 22),
              ),
            ),
            body: Container(
              color: Colors.yellowAccent[100],
              child: Form(
                  key: fromKey,
                  child: Padding(
                    padding: const EdgeInsets.all(10), // กำหนดช่องว่างของกรอบ
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.greenAccent,
                          child: TextFormField(
                            maxLength: 20,
                            // สร้าง ตัวกรอกข้อมูล
                            decoration: InputDecoration(
                                counterText: "",
                                fillColor: Colors.greenAccent,
                                labelText: "${language.langeage_List["title"]}",
                                labelStyle: TextStyle(fontSize: 25),
                                border: OutlineInputBorder()),
                            style: TextStyle(fontSize: 20),
                            controller: titleController, // ตัวแปรรับค่าข้อมูล
                            validator: (String? str) {
                              // เช็คค่า ว่าง
                              if (str!.isEmpty) {
                                // หากว่าผู้ใช้ยังไม่กรอกข้อมูล
                                return "${language.langeage_List["ple_error"]}"; // จะทำการแจ้งเตือน ข้อความ
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          color: Colors.greenAccent,
                          child: TextFormField(
                            style: TextStyle(fontSize: 18),
                            maxLines: 14,
                            // สร้าง ตัวกรอกข้อมูล
                            decoration: InputDecoration(
                              fillColor: Colors.green,
                              labelText:
                                  "${language.langeage_List["subtitle"]}",
                              labelStyle: TextStyle(fontSize: 25),
                              border: OutlineInputBorder(),
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 27.0, horizontal: 12),
                            ),
                            controller:
                                subtitleContrallor, // ตัวแปรรับค่าข้อมูล
                            validator: (String? str) {
                              // เช็คค่า ว่าง
                              if (str!.isEmpty) {
                                // หากว่าผู้ใช้ยังไม่กรอกข้อมูล
                                return "${language.langeage_List["ple_error"]}"; // จะทำการแจ้งเตือน ข้อความ
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FlatButton(
                            // สร้างปุ่มบันทึกข้อมูล
                            color: Colors.brown,
                            onPressed: () {
                              if (fromKey.currentState!.validate()) {
                                var title = titleController.text;
                                var subtitle = subtitleContrallor.text;

                                var provider = Provider.of<DataProvider>(
                                    context,
                                    listen: false);
                                provider.addData(DataList(
                                    title: title,
                                    subtitle: subtitle,
                                    date: DateFormat("dd/MM/yyyy")
                                        .format(DateTime.now())));

                                // ปิดหน้า widget หลังจากกรอกข้อมูล
                                Navigator.pop(context);
                              }
                            },
                            child: Text(
                              "${language.langeage_List['save']}",
                              style: TextStyle(color: Colors.white60),
                            ))
                      ],
                    ),
                  )),
            ));
      },
    );
  }
}
