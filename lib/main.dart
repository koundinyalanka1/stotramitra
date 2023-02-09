import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import './Mainpage.dart';
import 'Langdialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String lang;
  @override
  void initState() {
    super.initState();
    debugPrint(
        '--------------------------------------initState---------------------------------');
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _showSimpleDialog();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/play_store_512.png",
                  width: 325, height: 325),
              Text(
                'Stotra Mitra',
                style: TextStyle(fontSize: 32, backgroundColor: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showSimpleDialog() async {
    await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            // <-- SEE HERE
            //titlePadding: EdgeInsets.all(5.0),
              contentPadding: EdgeInsets.zero,
              title: const Text('Select Language',style: TextStyle(fontSize: 25),textAlign: TextAlign.center,),
              children: <Widget>[
                Container(
                  child: Column(
                    children: [
                      Langdialog(),
                      SizedBox(height: 7.0,),
                      SizedBox(
                        //width: double.maxFinite,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);

                            getLanguage().then((String value) {
                              lang = value;
                              setAppLocale(value);
                            }
                            );


                          },
                          child: Text('OK',style: TextStyle(fontSize: 17)),
                        ),
                      ),

                    ],
                  ),
                ),

              ]);
        });
  }

  String setAppLocale(String value) {
    Fluttertoast.showToast(
        msg: value+" Selected. This can be changed in settings",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
    Timer(
      Duration(seconds: 1),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MaterialApp(
            home: Mainpage(),
          ),
        ),
      ),
    );
    return value;
  }

  Future<String> getLanguage() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('language')) {
      String? info = await prefs.getString('language');
      print(info!+' in main');
      return info;
    }
    return 'en';
  }
}
