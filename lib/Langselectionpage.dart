import "package:flutter/material.dart";
import "./Mainpage.dart";

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
  List menuList = [
    _MenuItem('assets/images/bengali.png', 'Bengali'),
    _MenuItem('assets/images/hindi.png', 'Hindi'),
    _MenuItem('assets/images/english.png', 'English'),
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
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, position) {
            return Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                    onTap: () {
                     /* Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MaterialApp(
                                home: Mainpage(),
                              ),),);*/
                    },
                    child: Center(
                      child: Column(
                        children: [
                          Center(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0)),
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                  menuList[position].icon,
                                  height: 70,
                                  width: 70,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                menuList[position].title,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),

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

  _MenuItem(this.icon, this.title);
}

