import 'package:flutter/cupertino.dart';
import 'package:list_app/data_base/db.dart';
import 'package:list_app/language/en_lang.dart';
import 'package:list_app/language/jp_lang.dart';
import 'package:list_app/language/th_lang.dart';

class LanguageDefalt with ChangeNotifier {
  Map<String, String> langeage_List = {
    "list": "List",
    "add_data": "Add information",
    "title": "Heading",
    "subtitle": "Information",
    "ple_error": "Please enter message",
    "save": "Save",
    "no_data": "No Information",
    "setting": "Setting",
    "date":"Date"

  };

  Future<void> initeLanguage() async {
    var db = await DB_Class(db_name: "Language.db");
    var langRead = await db.readLanguageData();

    // if (langRead.isEmpty) langRead = "EN";
    print(langRead);
    if (langRead == "EN")
      EN();
    else if (langRead == "JP")
      JP();
    else if (langRead == "TH") TH();
    // print("FFFFFFFFF $langRead");
    notifyListeners();
  }

  Future<void> JP() async {
    langeage_List = JP_lang().jpLang;
    var db = DB_Class(db_name: "Language.db");
    await db.saveLanguagetData("JP");
    notifyListeners();
    // print("save jp");
  }

  Future<void> EN() async {
    langeage_List = await EN_lang().enLang;
    var db = DB_Class(db_name: "Language.db");
    await db.saveLanguagetData("EN");
    notifyListeners();
    // print("save en");
  }

  Future<void> TH() async {
    langeage_List = await TH_lang().thLang;
    var db = DB_Class(db_name: "Language.db");
    await db.saveLanguagetData("TH");
    notifyListeners();
    // print("save th");
  }
}
