import 'package:flutter/material.dart';
import 'package:mathpuzzle/continuepage.dart';
import 'package:mathpuzzle/secondpagepuzzles.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(home: Firstclass()));
}

class Firstclass extends StatefulWidget {
  static SharedPreferences? prefs;
  static String Isclear = "clear";
  static String Ispending = "pending";
  static String Isskip = "skip";
  static List<String> statuslist = [];

  @override
  State<Firstclass> createState() => _FirstclassState();
}

class _FirstclassState extends State<Firstclass> {
  String font = "Creepster";
  int? level;

  @override
  void initState() {
    super.initState();
    Sharepref();
  }

  Sharepref() async {
    Firstclass.prefs = await SharedPreferences.getInstance();
    level = Firstclass.prefs!.getInt("level") ?? 0;
    Firstclass.statuslist.clear();
    for (int i = 0; i <= 74; i++) {
      String levelstatus =
          Firstclass.prefs!.getString("status$i") ?? Firstclass.Ispending;
      Firstclass.statuslist.add(levelstatus);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF223DE5),
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.all(20),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 60),
              Text("Math Puzzles",
                  style: TextStyle(
                      fontFamily: font,
                      letterSpacing: 1,
                      fontStyle: FontStyle.italic,
                      fontSize: 34,
                      color: const Color(0xff0a24e5))),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) {
                                return Continuepage(font, level!);
                              },
                            ));
                          },
                          child: Text("CONTINUE",
                              style: TextStyle(
                                  fontSize: 34,
                                  letterSpacing: 1,
                                  color: Colors.white,
                                  fontFamily: font))),
                      const SizedBox(height: 10),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Secondpagepuzzles(font);
                              },
                            ));
                          },
                          child: Text("PUZZLES",
                              style: TextStyle(
                                  fontSize: 32,
                                  letterSpacing: 1,
                                  color: Colors.white,
                                  fontFamily: font)))
                    ],
                  ),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/blackboard_main_menu.png"),
                          fit: BoxFit.fill)),
                ),
              ),
              const SizedBox(height: 60)
            ]),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/background.jpg"),
                    fit: BoxFit.fill))),
      ),
    );
  }
}
