import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/controller/dashboard_controller.dart';
import 'dart:math' as math;

bool _customTileExpanded = false;

Widget experience(DashboardNotifier myData) {
  FlutterTts flutterTts = FlutterTts();

  void speakText() async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setSpeechRate(1.0);
    await flutterTts.setVolume(1.0);
    await flutterTts.speak('');
  }

  return Stack(
    children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text('Experience',
                      style: GoogleFonts.getFont(myData.currentFamily).copyWith(
                        color: Colors.white,
                        fontSize: 18,
                      )),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      myData.closeScreen();
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 500,
              padding: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Container(
                    height: 90,
                    width: 90,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'assets/icons/experience2.png',
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(height: 10),
                  // SizedBox(height: 10),
                  Container(
                    height: 380,
                    child: ListView.builder(
                      itemCount: myData.experience.length,
                      itemBuilder: (context, index) {
                        return MouseRegion(
                          onEnter: (_) {
                            myData.hoverin(index);
                          },
                          onExit: (_) {
                            myData.hoverout(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: myData.experience[index]['ishover']
                                  ? Color.lerp(
                                      Color(0xff1b1c16),
                                      myData.colors[myData.currentbackground]
                                          ['color'],
                                      0.08)
                                  : null,
                            ),
                            child: ExpansionTile(
                              leading: Container(
                                height: 40,
                                width: 5,
                                color: myData.colors[index]['color'],
                              ),
                              title: Text(myData.experience[index]['title'],
                                  style:
                                      GoogleFonts.getFont(myData.currentFamily)
                                          .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  )),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(myData.experience[index]['company'],
                                      style: GoogleFonts.getFont(
                                              myData.currentFamily)
                                          .copyWith(
                                        color: Colors.white,
                                        fontSize: 10,
                                      )),
                                  Text(myData.experience[index]['date'],
                                      style: GoogleFonts.getFont(
                                              myData.currentFamily)
                                          .copyWith(
                                        color: Colors.white,
                                        fontSize: 8,
                                      )),
                                ],
                              ),
                              trailing: Image.asset(
                                myData.experience[index]['isexpanded']
                                    ? 'assets/icons/uparrow.png'
                                    : 'assets/icons/downarrow.png',
                                color: Colors.white,
                                width: 20,
                              ),
                              children: <Widget>[
                                Container(
                                  height:
                                      myData.experience[index]['data'].length *
                                          50,
                                  child: ListView.builder(
                                    itemCount:
                                        myData.experience[index]['data'].length,
                                    itemBuilder: (context, indexinside) {
                                      return ListTile(
                                        leading: Text('• ',
                                            style: GoogleFonts.getFont(
                                                    myData.currentFamily)
                                                .copyWith(
                                              color: Colors.white,
                                              fontSize: 14,
                                            )),
                                        title: Transform.translate(
                                          offset: Offset(-16, 0),
                                          child: Text(
                                              myData.experience[index]['data']
                                                  [indexinside],
                                              style: GoogleFonts.getFont(
                                                      myData.currentFamily)
                                                  .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                              )),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                              onExpansionChanged: (bool expanded) {
                                myData.changeExpand(index, expanded);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ],
  );
}
