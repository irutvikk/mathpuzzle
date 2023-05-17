import 'package:flutter/material.dart';
import 'package:mathpuzzle/main.dart';
import 'package:mathpuzzle/winningpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Continuepage extends StatefulWidget {
  String font;
  SharedPreferences? prefs;
  int level;

  Continuepage(this.font, this.level);

  @override
  State<Continuepage> createState() => _ContinuepageState();
}

class _ContinuepageState extends State<Continuepage> {
  TextEditingController texteditcontroller = TextEditingController();
  List<String> answerlist = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30"
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: const Color(0xFF223DE5),
        body: SafeArea(
          child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/gameplaybackground.jpg"),
                      fit: BoxFit.fill)),
              child: Column(children: [
                const SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          Firstclass.statuslist[widget.level] =
                              Firstclass.Isskip;
                          Firstclass.prefs!.setString(
                              "status${widget.level}", Firstclass.Isskip);

                          texteditcontroller.text = "";
                          widget.level = (widget.level + 1);
                          Firstclass.prefs!.setInt("level", widget.level);

                          if (widget.level > 74) {
                            widget.level = (widget.level - 1);
                            Firstclass.prefs!.setInt("level", widget.level);
                          }

                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return Continuepage(widget.font, widget.level);
                            },
                          ));
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/skip.png"))),
                      ),
                    ),
                    Container(
                        width: 200,
                        height: 50,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/level_board.png"),
                                fit: BoxFit.fill)),
                        child: Center(
                            child: Text(
                          "Puzzle ${widget.level + 1}",
                          style: TextStyle(
                              letterSpacing: 1.5,
                              fontSize: 26,
                              fontFamily: widget.font),
                        ))),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/hint.png"))),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 370,
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/p${widget.level + 1}.png"),
                          fit: BoxFit.fill)),
                ),
                const Expanded(child: SizedBox()),
                Container(
                    padding: const EdgeInsets.all(5),
                    height: 110,
                    color: Colors.black,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 220,
                                child: TextField(
                                  textAlignVertical: TextAlignVertical.center,
                                  controller: texteditcontroller,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      hintText: "Enter Your Answer",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      focusColor: Colors.white,
                                      fillColor: Colors.white,
                                      enabled: false,
                                      filled: true),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      if (texteditcontroller.text == "") {
                                        texteditcontroller.text = "";
                                      } else {
                                        texteditcontroller.text =
                                            texteditcontroller.text.substring(
                                                0,
                                                texteditcontroller.text.length -
                                                    1);
                                      }
                                    });
                                  },
                                  child: const Image(
                                      width: 50,
                                      height: 40,
                                      image: AssetImage("images/delete.png"),
                                      fit: BoxFit.fill)),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: OutlinedButton(
                                      style: const ButtonStyle(
                                        overlayColor: MaterialStatePropertyAll(
                                            Colors.red),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.blueAccent),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (texteditcontroller.text ==
                                              answerlist[widget.level]) {
                                            //clear
                                            //skip
                                            //pending status check
                                            String levelstatus = Firstclass
                                                .statuslist[widget.level];
                                            if (levelstatus ==
                                                Firstclass.Isclear) {
                                              Navigator.pushReplacement(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return Winningpage(
                                                      widget.level,
                                                      widget.font);
                                                },
                                              ));
                                            } else if (levelstatus ==
                                                Firstclass.Isskip) {
                                              Firstclass.statuslist[widget
                                                  .level] = Firstclass.Isclear;
                                              Firstclass.prefs!.setString(
                                                  "status${widget.level}",
                                                  Firstclass.Isclear);
                                              Navigator.pushReplacement(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return Winningpage(
                                                      widget.level,
                                                      widget.font);
                                                },
                                              ));
                                            } else {
                                              Firstclass.statuslist[widget
                                                  .level] = Firstclass.Isclear;
                                              Firstclass.prefs!.setString(
                                                  "status${widget.level}",
                                                  Firstclass.Isclear);

                                              setState(() {
                                                widget.level = widget.level + 1;
                                              });

                                              Firstclass.prefs!.setInt(
                                                  "level", widget.level);
                                              Navigator.pushReplacement(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return Winningpage(
                                                      widget.level - 1,
                                                      widget.font);
                                                },
                                              ));
                                            }
                                          }
                                        });
                                      },
                                      child: const Text(
                                        "SUBMIT",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      )),
                                ),
                              )
                            ],
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            itemCount: 10,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: 40, crossAxisCount: 10),
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(
                                    left: 1, right: 1, top: 5, bottom: 1),
                                child: TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.grey.shade900)),
                                    onPressed: () {
                                      setState(() {
                                        texteditcontroller.text =
                                            texteditcontroller.text +
                                                index.toString();
                                        if (texteditcontroller.text.length >
                                            12) {
                                          texteditcontroller.text =
                                              texteditcontroller.text.substring(
                                                  0,
                                                  texteditcontroller
                                                          .text.length -
                                                      1);
                                        }
                                      });
                                    },
                                    child: Center(
                                        child: Text(
                                      "$index",
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ))),
                              );
                            },
                          )
                        ]))
              ])),
        ),
      ),
      onWillPop: showdialogue,
    );
  }

  Future<bool> showdialogue() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Are you sure you want to go back?",style: TextStyle(fontSize: 18,fontFamily: widget.font,letterSpacing: 1),),
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return Firstclass();
              },));
            }, child: Text("Yes",style: TextStyle(fontSize: 18,fontFamily: widget.font,letterSpacing: 1),)),
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text("No",style: TextStyle(fontSize: 18,fontFamily: widget.font,letterSpacing: 1)))
          ],
        );
      },
    );
    return Future.value(true);
  }
}
