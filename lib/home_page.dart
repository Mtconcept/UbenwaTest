import 'package:flutter/material.dart';
import 'package:ubenwa_test/animations.dart';
import 'package:ubenwa_test/constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.white, width: 5))),
        child: BottomNavigationBar(
          selectedItemColor: darkGrey,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle:
              bodyTextStyle.copyWith(fontWeight: FontWeight.bold),
          backgroundColor: primaryColor,
          currentIndex: 0, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Image.asset("$imgPath/Group 1109.png"),
              label: 'Screening',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xffED4D5B),
                    Color(0xffF9923B),
                  ], end: Alignment.bottomCenter, begin: Alignment.topCenter),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Patient',
            )
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FadeInLeft(
            delay: Duration(milliseconds: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vSize60,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset("$imgPath/Group 1131.png")],
                ),
                vSize24,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 7,
                              width: 17,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  gradient: LinearGradient(colors: [
                                    Color(0xff329789),
                                    Color(0xff42BD95),
                                  ])),
                            ),
                            hSize8,
                            Text(
                              "online",
                              style: bodyTextStyle.copyWith(
                                  color: darkGrey, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Text(
                          "New profile",
                          style:
                              headerText.copyWith(fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "ID --------",
                          style: headerText.copyWith(
                              fontWeight: FontWeight.w900, color: darkGrey),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Color(0xffFEE9DD).withAlpha(10),
                          shape: BoxShape.circle),
                      child: Image.asset(
                        "$imgPath/profile.png",
                        width: 30,
                      ),
                    )
                  ],
                ),
                vSize24,
                Text(
                  "Recording...",
                  style: bodyTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                vSize60,
                Center(child: Image.asset("$imgPath/Ubenwa Button.png"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
