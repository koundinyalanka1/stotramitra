import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SelectedLanguage { bn, hi, en, gu, kn, ml, or, ta, te }

class Langdialog extends StatefulWidget {
  const Langdialog({super.key});

  @override
  State<Langdialog> createState() => _MyStatefulWidgetState();
}


class _MyStatefulWidgetState extends State<Langdialog> {
  SelectedLanguage? _selectedLanguage = SelectedLanguage.en;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          title: const Text('বাংলা (Bengali)',style: TextStyle(fontSize: 18)),
          leading: Radio<SelectedLanguage>(
            value: SelectedLanguage.bn,
            groupValue: _selectedLanguage,
            onChanged: (SelectedLanguage? value) {
              setState(() {
                _selectedLanguage = value;
                setLanguage('bn');
              });
            },
          ),
          onTap: () {
            setState(() {
              _selectedLanguage = SelectedLanguage.bn;
              setLanguage('bn');
            });
          },
        ),
        ListTile(
          title: const Text('हिन्दी (Hindi)',style: TextStyle(fontSize: 18)),
          leading: Radio<SelectedLanguage>(
            value: SelectedLanguage.hi,
            groupValue: _selectedLanguage,
            onChanged: (SelectedLanguage? value) {
              setState(() {
                _selectedLanguage = value;
                setLanguage('hi');
              });
            },
          ),
          onTap: () {
            setState(() {
              _selectedLanguage = SelectedLanguage.hi;
              setLanguage('hi');
            });
          },
        ),
        ListTile(
          title: const Text('English',style: TextStyle(fontSize: 18)),
          leading: Radio<SelectedLanguage>(
            value: SelectedLanguage.en,
            groupValue: _selectedLanguage,
            onChanged: (SelectedLanguage? value) {
              setState(() {
                _selectedLanguage = value;
                setLanguage('en');
              });
            },
          ),
          onTap: () {
            setState(() {
              _selectedLanguage = SelectedLanguage.en;
              setLanguage('en');
            });
          },
        ),
        ListTile(
          title: const Text('ગુજરાતી (Gujarati)',style: TextStyle(fontSize: 18)),
          leading: Radio<SelectedLanguage>(
            value: SelectedLanguage.gu,
            groupValue: _selectedLanguage,
            onChanged: (SelectedLanguage? value) {
              setState(() {
                _selectedLanguage = value;
                setLanguage('gu');
              });
            },
          ),
          onTap: () {
            setState(() {
              _selectedLanguage = SelectedLanguage.gu;
              setLanguage('gu');
            });
          },
        ),
        ListTile(
          title: const Text('ಕನ್ನಡ (Kannada)',style: TextStyle(fontSize: 18)),
          leading: Radio<SelectedLanguage>(
            value: SelectedLanguage.kn,
            groupValue: _selectedLanguage,
            onChanged: (SelectedLanguage? value) {
              setState(() {
                _selectedLanguage = value;
                setLanguage('kn');
              });
            },
          ),
          onTap: () {
            setState(() {
              _selectedLanguage = SelectedLanguage.kn;
              setLanguage('kn');
            });
          },
        ),
        ListTile(
          title: const Text('മലയാളം (Malayalam)',style: TextStyle(fontSize: 18)),
          leading: Radio<SelectedLanguage>(
            value: SelectedLanguage.ml,
            groupValue: _selectedLanguage,
            onChanged: (SelectedLanguage? value) {
              setState(() {
                _selectedLanguage = value;
                setLanguage('ml');
              });
            },
          ),
          onTap: () {
            setState(() {
              _selectedLanguage = SelectedLanguage.ml;
              setLanguage('ml');
            });
          },
        ),
        ListTile(
          title: const Text('ଓଡିଆ (Odia)',style: TextStyle(fontSize: 18)),
          leading: Radio<SelectedLanguage>(
            value: SelectedLanguage.or,
            groupValue: _selectedLanguage,
            onChanged: (SelectedLanguage? value) {
              setState(() {
                _selectedLanguage = value;
                setLanguage('or');
              });
            },
          ),
          onTap: () {
            setState(() {
              _selectedLanguage = SelectedLanguage.or;
              setLanguage('or');
            });
          },
        ),
        ListTile(
          title: const Text('தமிழ் (Tamil)',style: TextStyle(fontSize: 18)),
          leading: Radio<SelectedLanguage>(
            value: SelectedLanguage.ta,
            groupValue: _selectedLanguage,
            onChanged: (SelectedLanguage? value) {
              setState(() {
                _selectedLanguage = value;
                setLanguage('ta');
              });
            },
          ),
          onTap: () {
            setState(() {
              _selectedLanguage = SelectedLanguage.ta;
              setLanguage('ta');
            });
          },
        ),
        ListTile(
          title: const Text('తెలుగు (Telugu)',style: TextStyle(fontSize: 18)),
          leading: Radio<SelectedLanguage>(
            value: SelectedLanguage.te,
            groupValue: _selectedLanguage,
            onChanged: (SelectedLanguage? value) {
              setState(() {
                _selectedLanguage = value;
                setLanguage('te');
              });
            },
          ),
          onTap: () {
            setState(
              () {
                _selectedLanguage = SelectedLanguage.te;
                setLanguage('te');
              },
            );
          },
        ),
      ],
    );
  }



  Future<String> setLanguage(String language) async {
    var prefs = await SharedPreferences.getInstance();
    print(language+' language');
    await prefs.setString('language', language);
    return 'null';
  }

}
