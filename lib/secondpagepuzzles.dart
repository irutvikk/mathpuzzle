import 'package:flutter/material.dart';
import 'package:mathpuzzle/continuepage.dart';
import 'package:mathpuzzle/main.dart';

class Secondpagepuzzles extends StatefulWidget {
  String font;

  Secondpagepuzzles(this.font);

  @override
  State<Secondpagepuzzles> createState() => _SecondpagepuzzlesState();
}

class _SecondpagepuzzlesState extends State<Secondpagepuzzles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF223DE5),
      body: SafeArea(
        child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/background.jpg"),
                    fit: BoxFit.fill)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 60),
              Center(
                child: Text("Select Puzzle",
                    style: TextStyle(
                        fontFamily: widget.font,
                        letterSpacing: 1,
                        fontSize: 34,
                        color: const Color(0xff0a24e5))),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: Firstclass.statuslist.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 100, crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    int level = Firstclass.prefs!.getInt("level")?? 0;
                    String levelstatus = Firstclass.statuslist[index];
                    if(levelstatus == Firstclass.Isclear)
                      {
                        return InkWell(onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return Continuepage(widget.font,index);
                            },
                          ));
                        },
                          child: Container(child: Center(child: Text("${index+1}",style: TextStyle(fontFamily: widget.font,fontSize: 50),textAlign: TextAlign.center)),
                            margin:  EdgeInsets.all(5),
                            decoration:  BoxDecoration(borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black54),
                                image: DecorationImage(
                                    image: AssetImage("images/tick.png"),fit: BoxFit.fill)),
                          ),
                        );
                      }else if(levelstatus == Firstclass.Isskip){
                      return InkWell(onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return Continuepage(widget.font,index);
                          },
                        ));
                      },
                        child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.black54)),
                          child: Center(child: Text("${index+1}",style: TextStyle(fontFamily: widget.font,fontSize: 50))),
                          margin:  EdgeInsets.all(5),
                        ),
                      );
                    }else if(index == level){
                      return InkWell(onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return Continuepage(widget.font,index);
                          },
                        ));
                      },
                        child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.black54)),
                          child: Center(child: Text("${index+1}",style: TextStyle(fontFamily: widget.font,fontSize: 50))),
                          margin:  EdgeInsets.all(5),
                        ),
                      );
                    }
                    else{
                      return Container(
                        margin:  EdgeInsets.all(5),
                        decoration:  BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/lock.png"))),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 120)
            ])),
      ),
    );
  }
}
