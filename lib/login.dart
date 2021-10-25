import 'package:flutter/material.dart';
import 'package:ubenwa_test/animations.dart';
import 'package:ubenwa_test/constants.dart';
import 'package:ubenwa_test/home_page.dart';

class LoginScreen extends StatefulWidget {
  final bool isLogin;

  const LoginScreen({Key? key, required this.isLogin}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Container(
          decoration: BoxDecoration(gradient: gradient),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                vSize60,
                vSize60,
                Center(
                  child: Image.asset(
                    "$imgPath/logo.png",
                    width: 100,
                  ),
                ),
                vSize32,
                FadeIn(
                  child: Stack(
                    children: [
                      content(
                          context,
                          TabData(0, index, () {
                            setState(() {
                              index = 0;
                            });
                          }, () {
                            setState(() {
                              index = 1;
                            });
                          })),
                      content(
                          context,
                          TabData(1, index, () {
                            setState(() {
                              index = 1;
                            });
                          }, () {
                            setState(() {
                              index = 0;
                            });
                          })),
                    ],
                  ),
                ),
                vSize16,
                Text("or signup with"),
                vSize8,
                Image.asset(
                  "$imgPath/socials.png",
                  width: 200,
                ),
                vSize24
              ],
            ),
          )),
    );
  }

  content(context, TabData data) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      height: widget.isLogin
          ? MediaQuery.of(context).size.width / .85
          : MediaQuery.of(context).size.width / .7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50)),
          image: DecorationImage(
              image: AssetImage(
                data.index == data.groupValue
                    ? "$imgPath/Rectangle.png"
                    : "$imgPath/Rectangle1.png",
              ),
              fit: BoxFit.cover)),
      child: Column(
        children: [
          vSize12,
          Text(
            widget.isLogin ? "Login" : "SignUp",
            style: headerText.copyWith(fontWeight: FontWeight.w900),
          ),
          vSize24,
          customTextField("Username"),
          widget.isLogin ? SizedBox() : vSize16,
          widget.isLogin ? SizedBox() : customTextField("Email"),
          vSize16,
          customTextField("Password"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Text(
              "By entering your details, your are agreeing to our Terms of Service and Privacy Policy. Thanks!",
              style: bodyTextStyle.copyWith(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return HomePage();
              }));
            },
            child: Container(
              height: 46,
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: LinearGradient(colors: [
                    Color(0xff77A9E0),
                    Color(0xff45B8F0),
                  ])),
              child: Center(
                  child: Text(
                "Continue",
                style: bodyTextStyle.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              )),
            ),
          ),
          vSize60,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    data.onTap1!();
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Image.asset('$imgPath/Stethoscope.png'),
                        Text("Clinical User")
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    data.onTap2!();
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Image.asset('$imgPath/user.png'),
                        Text("Register User")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TabData {
  final int? index;
  final int? groupValue;
  final Function? onTap1;
  final Function? onTap2;

  TabData(this.index, this.groupValue, this.onTap1, this.onTap2);
}
