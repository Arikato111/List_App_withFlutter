import 'package:flutter/material.dart';
import 'package:list_app/colors/color_class.dart';
import 'package:list_app/language/language_class.dart';
import 'package:list_app/provider/data_Provider.dart';
import 'package:provider/provider.dart';
import 'screen/one_screen.dart';
import 'colors/color_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return DataProvider();
        }),
        ChangeNotifierProvider(create: (context){
          return LanguageDefalt();
        })
        
      ],
      // ignore: prefer_const_constructors
      child: MaterialApp(
        title: 'Arikato',
        theme: ThemeData(
          primarySwatch: primaryBlack,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<LanguageDefalt>(context, listen: false).initeLanguage();
    
  }
  @override
  Widget build(BuildContext context) {
    return OneScreen();
  }
}
