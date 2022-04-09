import 'dart:io';

import 'package:list_app/class_data/data_class.dart';
import 'package:list_app/provider/data_Provider.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class DB_Class {
  String? db_name;

  DB_Class({this.db_name});

  Future<Database> openDatabase() async {
    // เปิดที่เก็บข้อมูลของ app ภายในเครื่อง
    // ส่วนค้นหาที่อยู่
    Directory appDirectory =
        await getApplicationDocumentsDirectory(); // ค้นหาที่อยู่ของ ที่เก็บข้อมูลภายในเครื่อง
    String dbLocation =
        join(appDirectory.path, db_name); // สร้างที่อยู่ไฟล์เก็บข้อมูล

    // สร้างไฟล์เก็บข้อมูล
    DatabaseFactory dbFactory = await databaseFactoryIo; // create factory
    Database db = await dbFactory.openDatabase(dbLocation); //open database
    return db; // return <Database> from opendata
  }

  // เพิ่มข้อมูล
  Future<int> InsertData(DataList statement) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");

    var keyID = store.add(db, {
      "title": statement.title,
      "subtitle": statement.subtitle,
      "date": statement.date
    });
    db.close();
    return keyID;
  }

  Future<Map<String, List<DataList>>> loadAllData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");
    var snapshot = await store.find(db,
        finder: Finder(sortOrders: [SortOrder(Field.key, false)]));

    Map<String, List<DataList>> data_list = {};
    for (var record in snapshot) {

      if(data_list[record["date"].toString()] == null) {
        data_list[record["date"].toString()] = [];
      }
      
      data_list[record["date"].toString()]!.add(DataList(
        title: record["title"].toString(),
          subtitle: record["subtitle"].toString(),
          date: record["date"].toString()
      ));
          
    }
    return data_list;
  }

  //language //
  //language //
  Future saveLanguagetData(String statement) async {
    var db = await this.openDatabase();
    var store = StoreRef<String, String>.main();
    await store.record("languageRec").put(db, statement);
    var data = await store.record("languageRec").get(db);
    // print("daaaaaaaaaaaa $data");
    db.close();
  }

  Future<String> readLanguageData() async {
    var db = await this.openDatabase();
    var store = StoreRef<String, String>.main();

    String? langType;
    langType = await store.record("languageRec").get(db);

    db.close();
    return langType.toString();
  }
}
