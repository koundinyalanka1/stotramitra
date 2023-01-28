import "package:flutter/material.dart";
import "./Mainpage.dart";
import 'package:shared_preferences/shared_preferences.dart';


class Langselectionpage extends StatelessWidget {
  const Langselectionpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SafeArea(
          child: MyHomePage(),
        ),
      ),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String lang_code='';
  List menuList = [
    _MenuItem('assets/images/bengali.png', 'Bengali','bn'),
    _MenuItem('assets/images/hindi.png', 'Hindi','hi'),
    _MenuItem('assets/images/english.png', 'English','en'),
    _MenuItem('assets/images/gujarati.png', 'Gujarati','gu'),
    _MenuItem('assets/images/kannada.png', 'Kannada','kn'),
    _MenuItem('assets/images/malayalam.png', 'Malayalam','ml'),
    _MenuItem('assets/images/odia.png', 'Odia','or'),
    _MenuItem('assets/images/tamil.png', 'Tamil','ta'),
    _MenuItem('assets/images/telugu.png', 'Telugu','te'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language Selection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, position) {
            return Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                    onTap: () {
                      lang_code=menuList[position].code;
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MaterialApp(
                                home: Mainpage(),
                              ),),);
                    },
                    child: Center(
                      child: Column(
                        children: [
                          Center(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)),
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.asset(
                                  menuList[position].icon,
                                  height: 120,
                                  width: 120,

                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                menuList[position].title,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),

                              ),
                            ),
                          )
                        ],
                      ),
                    )));
          },
          itemCount: menuList.length,
        ),
      ),
    );
  }
}

class _MenuItem {
  final String icon;
  final String title;
  final String code;
  _MenuItem(this.icon, this.title,this.code);
}

