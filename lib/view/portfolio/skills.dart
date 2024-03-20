import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/controller/dashboard_controller.dart';
import 'dart:math' as math;

bool _customTileExpanded = false;

Widget skills(DashboardNotifier myData) {
  var generatedColor = Random().nextInt(Colors.primaries.length);

  return Container(
    margin: EdgeInsets.symmetric(horizontal: 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Text('Skills',
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 5),
                Container(
                  height: 80,
                  width: 80,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/icons/skills.png',
                        color: Colors.white,
                      )),
                ),
                SizedBox(height: 10),
                SizedBox(height: 10),
                Text(myData.skillsdata[0]['title'],
                    style: GoogleFonts.getFont(myData.currentFamily).copyWith(
                      color: Colors.white,
                      fontSize: 18,
                    )),
                Wrap(
                  spacing: 10.0,
                  children: (myData.skillsdata[0]['data'] as List<dynamic>)
                      .map((skill) {
                    return Container(
                      margin: EdgeInsets.only(top: 15, left: 5, right: 7),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.primaries[
                                  Random().nextInt(Colors.primaries.length)],
                              width: 0.5),
                          borderRadius: BorderRadius.circular(6),
                          color: Color.lerp(
                            Color(0xff1b1c16),
                            myData.colors[myData.currentbackground]['color'],
                            0.08,
                          ),
                        ),
                        child: Text(
                          skill
                              .toString(), // Ensure you convert it to String if needed
                          style: GoogleFonts.getFont(myData.currentFamily)
                              .copyWith(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    color: Color.lerp(
                      Color(0xff1b1c16),
                      myData.colors[myData.currentbackground]['color'],
                      0.3,
                    ),
                  ),
                ),
                Text(myData.skillsdata[1]['title'],
                    style: GoogleFonts.getFont(myData.currentFamily).copyWith(
                      color: Colors.white,
                      fontSize: 18,
                    )),
                Wrap(
                  spacing: 10.0,
                  children: (myData.skillsdata[1]['data'] as List<dynamic>)
                      .map((skill) {
                    return Container(
                      margin: EdgeInsets.only(top: 15, left: 5, right: 7),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.primaries[
                                  Random().nextInt(Colors.primaries.length)],
                              width: 0.5),
                          borderRadius: BorderRadius.circular(6),
                          color: Color.lerp(
                            Color(0xff1b1c16),
                            myData.colors[myData.currentbackground]['color'],
                            0.08,
                          ),
                        ),
                        child: Text(
                          skill
                              .toString(), // Ensure you convert it to String if needed
                          style: GoogleFonts.getFont(myData.currentFamily)
                              .copyWith(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
