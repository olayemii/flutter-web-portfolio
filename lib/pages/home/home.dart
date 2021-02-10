import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portfolio/pages/home/components/carousel.dart';
import 'package:web_portfolio/pages/home/components/cv_section.dart';
import 'package:web_portfolio/pages/home/components/header.dart';
import 'package:web_portfolio/pages/home/components/ios_app_ad.dart';
import 'package:web_portfolio/utils/adaptive_layout.dart';
import 'package:web_portfolio/utils/constants.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 66.0,
                child: Header(),
              ),
              Carousel(),
              SizedBox(
                height: 20.0,
              ),
              CvSection(),
              SizedBox(
                height: 100.0,
              ),
              IosAppAd(),
              SizedBox(
                height: 100.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
