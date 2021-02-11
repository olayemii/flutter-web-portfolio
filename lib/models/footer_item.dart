import 'package:flutter/material.dart';

class FooterItem {
  final String iconPath;
  final String title;
  final String text1;
  final String text2;

  FooterItem({
    @required this.iconPath,
    this.text1 = "",
    this.text2 = "",
    @required this.title,
  });
}
