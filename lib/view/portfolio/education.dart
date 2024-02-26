import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/controller/dashboard_controller.dart';
import 'dart:math' as math;

Widget education(DashboardNotifier myData) {
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
                          'assets/icons/education.png',
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(height: 10),
                  // SizedBox(height: 10),
                  Container(
                    height: 380,
                    child: Container(
                      decoration: BoxDecoration(),
                      child: ExpansionTile(
                        leading: Container(
                          height: 40,
                          width: 3,
                          color: Colors.red,
                        ),
                        title: Text('BSc Computer Science programme',
                            style: GoogleFonts.getFont(myData.currentFamily)
                                .copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            )),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Atma Ram Sanatan Dharma College',
                                style: GoogleFonts.getFont(myData.currentFamily)
                                    .copyWith(
                                  color: Colors.white,
                                  fontSize: 10,
                                )),
                            Text('2018 - 2021 | New Delhi, India ',
                                style: GoogleFonts.getFont(myData.currentFamily)
                                    .copyWith(
                                  color: Colors.white,
                                  fontSize: 8,
                                )),
                          ],
                        ),
                        children: <Widget>[],
                        onExpansionChanged: (bool expanded) {},
                      ),
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
