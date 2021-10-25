import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const imgPath = "assets/images";
const gradient = LinearGradient(
  begin: Alignment.topCenter,
  stops: [.5, .8],
  end: Alignment.bottomCenter,
  colors: [
    Color(0xffFFE5D6),
    Color(0xff85D3FF),
  ],
);

const primaryColor = Color(0xffFFE5D6);
const secondaryColor = Color(0xff85D3FF);
const darkBlue = Color(0xff384571);
const darkGrey = Color(0xff88879C);

/// this the vertical constants sized box
const vSize12 = SizedBox(height: 12);
const vSize16 = SizedBox(height: 16);
const vSize4 = SizedBox(height: 4);
const vSize18 = SizedBox(height: 18);
const vSize8 = SizedBox(height: 8);
const vSize24 = SizedBox(height: 24);
const vSize32 = SizedBox(height: 32);
const vSize36 = SizedBox(height: 36);
const vSize48 = SizedBox(height: 48);
const vSize60 = SizedBox(height: 60);
const vSize40 = SizedBox(height: 40);

/// this the horizontal constants sized box

const hSize16 = SizedBox(width: 16);
const hSize8 = SizedBox(width: 8);
const hSize24 = SizedBox(width: 24);
const hSize32 = SizedBox(width: 32);
const hSize36 = SizedBox(width: 36);

var bodyTextStyle = GoogleFonts.manjari(color: darkBlue);
var headerText = GoogleFonts.mPlusRounded1c(color: darkBlue, fontSize: 18);

customTextField(String headerText) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headerText,
          style: bodyTextStyle,
        ),
        vSize4,
        Container(
          decoration: BoxDecoration(
              color: Color(0xffE2EDFC),
              boxShadow: [
                BoxShadow(
                    color: Color(0xffF9923B66).withOpacity(0.2),
                    offset: Offset(0, 2),
                    spreadRadius: .4,
                    blurRadius: 4),
              ],
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.white, width: 5)),
          child: Center(
            child: TextField(
              cursorHeight: 16,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 16),
                  hintStyle: TextStyle(color: Colors.grey[800], fontSize: 12),
                  hintText: "Type in your text",
                  fillColor: Colors.white70),
            ),
          ),
        ),
      ],
    ),
  );
}
