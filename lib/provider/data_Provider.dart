// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:list_app/class_data/data_class.dart';
import 'package:list_app/data_base/db.dart';

class DataProvider with ChangeNotifier {
  // ignore: non_constant_identifier_names
  Map<String, List<DataList>> DataPro_list = {};

  void initData() async {
    var db = DB_Class(db_name: "DataList.db");

    DataPro_list = await db.loadAllData();
    notifyListeners();
  }

  void addData(DataList data) async {
    var db = DB_Class(db_name: "DataList.db");
    await db.InsertData(data);

    DataPro_list = await db.loadAllData();
    notifyListeners();
  }

  List getHead() {
    Set head = {};
    for (var i in DataPro_list.keys){
      head.add(i);
    }

    return head.toList();
  }
}
