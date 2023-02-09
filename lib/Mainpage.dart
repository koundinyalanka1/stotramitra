import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './Stotras.dart';

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  static const String _title = 'Stotra Mitra';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _groupValue = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(getLanguage().toString());
    //_showAlertDialog();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Stotras(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/ic_action_om.png')),
            label: 'Stotras',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: 'Bookmarks',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/ic_action_peacock.png')),
            label: 'Bhagavad Gita',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  Future<String> getLanguage() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('language')) {
      String? info = await prefs.getString('language');
      print(info!+' in main page');
      return info;
    }
    return 'en';
  }


}
