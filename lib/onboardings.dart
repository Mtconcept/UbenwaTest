import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ubenwa_test/animations.dart';
import 'package:ubenwa_test/login.dart';

import 'constants.dart';

class Onboardings extends StatefulWidget {
  @override
  _OnboardingsState createState() => _OnboardingsState();
}

class _OnboardingsState extends State<Onboardings> {
  var pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              vSize36,
              _skip(context),
              vSize24,
              Expanded(
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: onboardingList.length,
                  onPageChanged: (val) {
                    setState(() {
                      pageIndex = val;
                    });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    var data = onboardingList[index];
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FadeInLeftBig(
                            child: Text(
                              data.headerText ?? "",
                              style: GoogleFonts.mPlusRounded1c(
                                  fontSize: 18,
                                  color: darkBlue,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          vSize8,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              data.bodyText ?? "",
                              style: bodyTextStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Spacer(),
                          FadeInRightBig(
                            delay: Duration(milliseconds: 800),
                            child: Image.asset(
                              "$imgPath/${data.image}",
                              width: 250,
                            ),
                          ),
                          Spacer(),
                          Spacer(),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return LoginScreen(
                          isLogin: true,
                        );
                      }));
                    },
                    child: Chip(
                      label: Text("Login",
                          style: bodyTextStyle.copyWith(
                              color: Colors.grey, fontWeight: FontWeight.bold)),
                      backgroundColor: secondaryColor,
                      side: BorderSide(color: Colors.grey),
                      labelPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                  _dot(pageIndex),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return LoginScreen(
                          isLogin: false,
                        );
                      }));
                    },
                    child: Chip(
                      label: Text("Sign Up",
                          style: bodyTextStyle.copyWith(
                              color: Colors.grey, fontWeight: FontWeight.bold)),
                      backgroundColor: secondaryColor,
                      side: BorderSide(color: Colors.grey),
                      labelPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ],
              ),
              vSize60,
            ],
          ),
        ),
      ),
    );
  }
}

_skip(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            return LoginScreen(
              isLogin: false,
            );
          }));
        },
        child: Chip(
          label: Text(
            "Skip",
            style: TextStyle(color: Colors.grey),
          ),
          labelPadding: EdgeInsets.symmetric(horizontal: 16),
          side: BorderSide(color: Colors.grey),
          backgroundColor: primaryColor,
        ),
      )
    ],
  );
}

_dot(int pageIndex) {
  return Container(
    height: 8,
    child: ListView.builder(
        shrinkWrap: true,
        itemCount: onboardingList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            height: 4,
            width: pageIndex == index ? 24 : 8,
            decoration: BoxDecoration(
                color: Color(0xff88879C),
                borderRadius: BorderRadius.circular(50)),
          );
        }),
  );
}

class OnboardingData {
  final String? headerText;
  final String? bodyText;
  final String? image;

  OnboardingData(this.headerText, this.bodyText, this.image);
}

var onboardingList = [
  OnboardingData(
      "Cuite Baby",
      "By entering your details, your are agreeing to our Terms of Service and Privacy Policy. Thanks!",
      "Onboarding.png"),
  OnboardingData(
      "Record Cry",
      "By entering your details, your are agreeing to our Terms of Service and Privacy Policy. Thanks!",
      "Onboarding1.png"),
  OnboardingData(
      "Screening Cry",
      "By entering your details, your are agreeing to our Terms of Service and Privacy Policy. Thanks!",
      "Onboarding2.png"),
  OnboardingData(
      "Result",
      "By entering your details, your are agreeing to our Terms of Service and Privacy Policy. Thanks!",
      "Onboarding3.png"),
  OnboardingData(
      "Recommendation",
      "By entering your details, your are agreeing to our Terms of Service and Privacy Policy. Thanks!",
      "Onboarding4.png"),
];
