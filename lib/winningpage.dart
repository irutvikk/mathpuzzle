import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mathpuzzle/continuepage.dart';
import 'package:mathpuzzle/main.dart';

class Winningpage extends StatefulWidget {
  int level;
  String font;

  Winningpage(this.level, this.font);

  @override
  State<Winningpage> createState() => _WinningpageState();
}

class _WinningpageState extends State<Winningpage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      backgroundColor: const Color(0xFF223DE5),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/background.jpg"),
                  fit: BoxFit.fill)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 70, top: 40, right: 70),
                alignment: Alignment.center,
                child: Text(
                  "PUZZLE ${widget.level + 1} COMPLETED",
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 30,
                      color: const Color(0xFF223DE5),
                      fontFamily: widget.font),
                ),
              ),
              Container(
                  margin:
                  const EdgeInsets.only(
                      left: 70, top: 20, right: 70, bottom: 20),
                  child: const Image(
                      image: AssetImage("images/trophy.png"),
                      fit: BoxFit.fill,
                      height: 350)),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return Continuepage(widget.font, widget.level + 1);
                    },
                  ));
                },
                child: Container(
                    height: 45,
                    width: 180,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(colors: [
                          Colors.blueGrey.shade700,
                          Colors.white,
                          Colors.blueGrey.shade500,
                          Colors.blueGrey.shade700
                        ])),
                    child: Text("CONTINUE",
                        style: TextStyle(
                            fontFamily: widget.font,
                            fontSize: 24,
                            letterSpacing: 1.5))),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return Firstclass();
                    },
                  ));
                },
                child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 45,
                    width: 180,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(colors: [
                          Colors.blueGrey.shade700,
                          Colors.white,
                          Colors.blueGrey.shade500,
                          Colors.blueGrey.shade700
                        ])),
                    child: Text("MAIN MENU",
                        style: TextStyle(
                            fontFamily: widget.font,
                            fontSize: 24,
                            letterSpacing: 1.5))),
              ),
            ],
          ),
        ),
      ),
    ), onWillPop: awesomedialogue);
  }

  Future<bool> awesomedialogue() {
    AwesomeDialog(context: context, animType: AnimType.scale,
      dialogType: DialogType.success,
      title: "You sure go back to last completed level?",
        btnOk: TextButton(onPressed: () {

          Navigator.pop(context);

          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return Continuepage(widget.font, widget.level);
          },));
        }, child: Text("Yes")),
      btnCancel: TextButton(onPressed: () {

        Navigator.pop(context);

      }, child: Text("No"))
    ).show();
    return Future.value(true);
  }
}
