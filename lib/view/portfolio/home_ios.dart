import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/controller/dashboard_controller.dart';

Widget homePageIos(DashboardNotifier myData) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        // alignment: Alignment.topCenter,
        margin: EdgeInsets.only(left: 00, top: 40),
        child: Text(
          myData.formatDateTimeIos(DateTime.now()),
          style: GoogleFonts.getFont(myData.currentFamily).copyWith(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      Container(
        // color: Colors.black,
        child: Text(
          myData.formatTimeIos(DateTime.now()),
          style: GoogleFonts.getFont(myData.currentFamily)
              .copyWith(color: Colors.white, fontSize: 55, height: 1),
        ),
      ),
      Spacer(),
      Container(
        height: 300,
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of icons per row
            crossAxisSpacing: 10.0, // Spacing between columns
            mainAxisSpacing: 20.0, // Spacing between rows
          ),
          itemCount:
              myData.icons.length, // Replace with the actual number of icons
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                myData.functions(myData.icons[index]['function'], context);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
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
                          color: myData.icons[index]['color'],
                          borderRadius: BorderRadius.circular(100)),
                      child: Image.asset(
                        myData.icons[index]['icon'],
                        color: Colors.white,
                      )),
                  SizedBox(height: 5),
                  Text(
                    myData.icons[index]['text'],
                    style: GoogleFonts.getFont(myData.currentFamily).copyWith(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Built using ',
            style: GoogleFonts.getFont(myData.currentFamily).copyWith(
              color: Colors.white,
              fontSize: 8,
            ),
          ),
          Image.asset(
            'assets/icons/flutter.png',
            width: 15,
          ),
          Text(
            ' with much ',
            style: GoogleFonts.getFont(myData.currentFamily).copyWith(
              color: Colors.white,
              fontSize: 8,
            ),
          ),
          Image.asset(
            'assets/icons/love.png',
            width: 15,
          ),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Center(
        child: Text(
          '@ ${DateTime.now().year} Mohit Kumar ',
          style: GoogleFonts.getFont(myData.currentFamily).copyWith(
            color: Colors.white,
            fontSize: 8,
          ),
        ),
      ),
      Spacer(),

      // Spacer(),
      Center(
        child: Container(
          width: 80,
          height: 3,
          margin: EdgeInsets.only(bottom: 10, top: 15),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    ],
  );
}
