import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF0056D7);
const kSecondaryColor = Color(0xFFE39600);
const kGreyColor = Color(0xFF535353);
const kWhiteColor = Color(0x0fffffff);

const kDefaultPadding = EdgeInsets.symmetric(horizontal: 20);

TextStyle titleText = const TextStyle(
  color: kGreyColor, fontSize: 32, fontWeight: FontWeight.w700);
TextStyle subTitle = const TextStyle(
  color: kSecondaryColor, fontSize: 18, fontWeight: FontWeight.w500);
TextStyle textButton = const TextStyle(
  color: kPrimaryColor,
  fontSize: 18,
  fontWeight: FontWeight.w700,
);