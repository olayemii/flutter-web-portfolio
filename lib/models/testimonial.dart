import 'package:flutter/material.dart';

class TestimonialModel {
  final String text;
  final String personName;
  final String occupation;
  final String profilePhoto;

  TestimonialModel({
    @required this.text,
    @required this.occupation,
    @required this.personName,
    @required this.profilePhoto,
  });
}
