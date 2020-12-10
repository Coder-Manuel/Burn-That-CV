import 'package:flutter/material.dart';

const Color kPrimaryColor = const Color(0xfffc8002);
const Color kSecColor = const Color(0xff00000);
const Color kBlackColor = const Color(0xff000000);
const Color kWhiteColor = const Color(0xffffffff);
const Color kTransparent = const Color(0xffff00);

const kStyle =
    TextStyle(fontSize: 18.0, color: kBlackColor, fontFamily: "Nunito");

final double minHeight = 750;

double getHeight(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  return height;
}

double getWidth(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return width;
}
