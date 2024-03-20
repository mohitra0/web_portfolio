// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/controller/dashboard_controller.dart';
import 'package:portfolio/utils/resize.dart';
import 'package:portfolio/view/portfolio/bio.dart';
import 'package:portfolio/view/portfolio/education.dart';
import 'package:portfolio/view/portfolio/experience.dart';
import 'package:portfolio/view/portfolio/home.dart';
import 'package:portfolio/view/portfolio/home_ios.dart';
import 'package:portfolio/view/portfolio/skills.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Consumer<DashboardNotifier>(
        builder: (context, DashboardNotifier myData, child) {
      return Scaffold(
        body: Container(
          width: SizeConfig.screenWidth!,
          decoration: BoxDecoration(),
          child: Stack(
            children: [
              Container(
                  height: SizeConfig.screenHeight!,
                  width: SizeConfig.screenWidth!,
                  child: Image.asset(
                    myData.colors[myData.currentbackground]['backimage'],
                    fit: BoxFit.cover,
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizeConfig.screenWidth! < 550
                          ? Container()
                          : Container(
                              height: 500,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      width: 200,
                                      height: 150,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: Colors.white.withOpacity(0.2)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 40,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                child: Image.asset(
                                                    'assets/images/mohitnew.jpeg')),
                                          ),
                                          Text(
                                            'Hey Guys!',
                                            style: GoogleFonts.getFont(
                                                    myData.currentFamily)
                                                .copyWith(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          AnimatedTextKit(
                                            animatedTexts: [
                                              TypewriterAnimatedText(
                                                'This is Mohit. and i love making random shit. which i dont even know and im going to make this text animate so yeah it\'s going to be fun',
                                                textStyle: GoogleFonts.getFont(
                                                        myData.currentFamily)
                                                    .copyWith(
                                                  fontSize: 8.0,
                                                  color: Colors.white,
                                                ),
                                                speed: const Duration(
                                                    milliseconds: 50),
                                              ),
                                            ],
                                            totalRepeatCount: 4,
                                            pause: const Duration(
                                                milliseconds: 1000),
                                            displayFullTextOnTap: true,
                                            stopPauseOnTap: false,
                                          )
                                        ],
                                      )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                      width: 200,
                                      height: 150,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: Colors.white.withOpacity(0.2)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 40,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                child: Container(
                                                  child: Image.asset(
                                                    'assets/icons/coding.png',
                                                  ),
                                                )),
                                          ),
                                          Text(
                                            'SKILLS',
                                            style: GoogleFonts.getFont(
                                                    myData.currentFamily)
                                                .copyWith(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Animate(
                                              effects: [
                                                FadeEffect(),
                                                ScaleEffect()
                                              ],
                                              child: Text(
                                                "FLUTTER | NODEJS | MONGODB | SQL | JENKINS | REACT | CLEVERTAP | MOENGAGE | MIXPANEL",
                                                style: GoogleFonts.getFont(
                                                        myData.currentFamily)
                                                    .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                ),
                                              )
                                                  .animate(
                                                      onPlay: (controller) =>
                                                          controller.repeat())
                                                  .shimmer(
                                                      duration: 1500.ms,
                                                      color: const Color(
                                                          0xFF8684FF))
                                                  .animate() // this wraps the previous Animate in another Animate
                                                  .fadeIn(
                                                      duration: 1300.ms,
                                                      curve: Curves.easeOutQuad)
                                                  .slide())
                                        ],
                                      )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: 200,
                                    height: 150,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.white.withOpacity(0.2)),
                                    child: Container(
                                      // height: 400,
                                      // margin: EdgeInsets.only(top: 10),
                                      // padding: EdgeInsets.symmetric(horizontal: 15),
                                      child: GridView.builder(
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount:
                                              3, // Number of icons per row
                                          crossAxisSpacing:
                                              5.0, // Spacing between columns
                                          mainAxisSpacing:
                                              10.0, // Spacing between rows
                                        ),
                                        itemCount: myData.colors
                                            .length, // Replace with the actual number of icons
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              myData.changeDefault(index);
                                            },
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 50,
                                                  width: 50,
                                                  // padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          myData.colors[index]
                                                              ['color'],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100)),
                                                  child: index ==
                                                          myData
                                                              .currentbackground
                                                      ? Icon(
                                                          Icons.check,
                                                          color: Colors.white,
                                                        )
                                                      : Container(),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      SizedBox(
                        width: 20,
                      ),
                      myData.currentPhone == 'ios'
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      height: 25,
                                      width: 4,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          bottomLeft: Radius.circular(16),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      height: 35,
                                      width: 4,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          bottomLeft: Radius.circular(16),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 200),
                                      height: 35,
                                      width: 4,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          bottomLeft: Radius.circular(16),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 15.0,
                                          spreadRadius: 5.0,
                                          offset: Offset(
                                            0.0,
                                            7.0,
                                          ),
                                        )
                                      ],
                                      border: Border.all(
                                          color: Colors.white, width: 2),
                                      borderRadius: BorderRadius.circular(46)),
                                  child: Container(
                                    height: 600,
                                    width: 300,
                                    decoration: myData.currentPage == 'homepage'
                                        ? BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xff292929),
                                                myData.colors[myData
                                                    .currentbackground]['color']
                                              ],
                                              stops: [0, 1],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                            ),
                                            border: Border.all(
                                                color: Colors.black, width: 13),
                                            borderRadius:
                                                BorderRadius.circular(46))
                                        : BoxDecoration(
                                            color: Color.lerp(
                                                Color(0xff1b1c16),
                                                myData.colors[myData
                                                        .currentbackground]
                                                    ['color'],
                                                0.01),
                                            border: Border.all(
                                                color: Colors.black, width: 13),
                                            borderRadius:
                                                BorderRadius.circular(46)),
                                    child: Stack(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 4),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 1, left: 5),
                                                child: Text(
                                                  'Airtel',
                                                  style: GoogleFonts.getFont(
                                                          myData.currentFamily)
                                                      .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 25,
                                              ),
                                              Spacer(),
                                              Spacer(),
                                              Container(
                                                margin: EdgeInsets.only(top: 2),
                                                child: Image.asset(
                                                  'assets/icons/iosnetwork.png',
                                                  width: 11,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 2),
                                                child: Image.asset(
                                                  'assets/icons/ioswifi.png',
                                                  width: 12,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              Image.asset(
                                                'assets/icons/iosbattery.png',
                                                width: 17,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Container(
                                            margin: EdgeInsets.only(top: 0),
                                            height: 20,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(12),
                                                  bottomRight:
                                                      Radius.circular(12)),
                                            ),
                                          ),
                                        ),
                                        myData.currentPage == 'education'
                                            ? education(myData)
                                            : myData.currentPage == 'homepage'
                                                ? homePageIos(myData)
                                                : myData.currentPage ==
                                                        'aboutme'
                                                    ? bioData(myData)
                                                    : myData.currentPage ==
                                                            'experience'
                                                        ? experience(myData)
                                                        : myData.currentPage ==
                                                                'skills'
                                                            ? skills(myData)
                                                            : Container(),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      height: 25,
                                      width: 4,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          bottomLeft: Radius.circular(16),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      height: 35,
                                      width: 4,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          bottomLeft: Radius.circular(16),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 200),
                                      height: 35,
                                      width: 4,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          bottomLeft: Radius.circular(16),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 600,
                                  width: 300,
                                  decoration: myData.currentPage == 'homepage'
                                      ? BoxDecoration(
                                          boxShadow: [
                                              BoxShadow(
                                                color: Colors.black26,
                                                blurRadius:
                                                    15.0, // soften the shadow
                                                spreadRadius:
                                                    5.0, //extend the shadow
                                                offset: Offset(
                                                  0.0, // Move to right 10  horizontally
                                                  7.0, // Move to bottom 10 Vertically
                                                ),
                                              )
                                            ],
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xff292929),
                                              myData.colors[myData
                                                  .currentbackground]['color']
                                            ],
                                            stops: [0, 1],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                          ),
                                          border: Border.all(
                                              color: Colors.black, width: 10),
                                          borderRadius:
                                              BorderRadius.circular(26))
                                      : BoxDecoration(
                                          color: Color.lerp(
                                              Color(0xff1b1c16),
                                              myData.colors[myData
                                                  .currentbackground]['color'],
                                              0.01),
                                          border: Border.all(
                                              color: Colors.black, width: 10),
                                          borderRadius:
                                              BorderRadius.circular(26)),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          margin: EdgeInsets.only(top: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(
                                                    myData.formatTime(
                                                        DateTime.now()),
                                                    style: GoogleFonts.getFont(
                                                            myData
                                                                .currentFamily)
                                                        .copyWith(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 25,
                                                  ),
                                                  Spacer(),
                                                  Align(
                                                    alignment:
                                                        Alignment.topCenter,
                                                    child: Container(
                                                      height: 15,
                                                      width: 15,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                      ),
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Icon(
                                                    Icons.volume_off,
                                                    color: Colors.white,
                                                    size: 13,
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Icon(
                                                    Icons.wifi_rounded,
                                                    color: Colors.white,
                                                    size: 13,
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Icon(
                                                    Icons.battery_full,
                                                    color: Colors.white,
                                                    size: 13,
                                                  ),
                                                  Text(
                                                    '100%',
                                                    style: GoogleFonts.getFont(
                                                            myData
                                                                .currentFamily)
                                                        .copyWith(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      myData.currentPage == 'education'
                                          ? education(myData)
                                          : myData.currentPage == 'homepage'
                                              ? homePage(myData)
                                              : myData.currentPage == 'aboutme'
                                                  ? bioData(myData)
                                                  : myData.currentPage ==
                                                          'experience'
                                                      ? experience(myData)
                                                      : myData.currentPage ==
                                                              'skills'
                                                          ? skills(myData)
                                                          : Container(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                        width: 220,
                        height: 40,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                myData.changephone('android');
                              },
                              child: Container(
                                width: 70,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: myData.currentPhone == 'android'
                                      ? Colors.white
                                      : null,
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.android,
                                  color: myData.currentPhone == 'android'
                                      ? Colors.black
                                      : Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                myData.changephone('ios');
                              },
                              child: Container(
                                width: 70,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: myData.currentPhone == 'ios'
                                      ? Colors.white
                                      : null,
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.apple,
                                  color: myData.currentPhone == 'ios'
                                      ? Colors.black
                                      : Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      'Best experienced on desktop for optimal performance.',
                      style: GoogleFonts.getFont(myData.currentFamily).copyWith(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: GestureDetector(
                    onTap: () {
                      myData.launchEmail('mohitormohit@gmail.com', 'Hi Mohit',
                          'I want to hire you');
                    },
                    child: Container(
                        width: 120,
                        height: 40,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(100),
                              bottomRight: Radius.circular(100)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 15.0, // soften the shadow
                              spreadRadius: 5.0, //extend the shadow
                              offset: Offset(
                                0.0, // Move to right 10  horizontally
                                7.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                          gradient: LinearGradient(
                            colors: [
                              Colors.white,
                              Colors.white,
                            ],
                            stops: [0, 1],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/hireme.png',
                              color: myData.colors[myData.currentbackground]
                                  ['color'],
                              width: 20,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Hire me!',
                              style: GoogleFonts.getFont(myData.currentFamily)
                                  .copyWith(
                                color: myData.colors[myData.currentbackground]
                                    ['color'],
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
