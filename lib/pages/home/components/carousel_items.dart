import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portfolio/models/carousel_item.dart';
import 'package:web_portfolio/utils/adaptive_layout.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/mouse_region_span.dart';

List<CarouselItem> carouselItems = [
  CarouselItem(
    image: Container(
      child: Image.asset(
        "assets/person.png",
        fit: BoxFit.contain,
        // height: 500.0,
      ),
    ),
    text: RepaintBoundary(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "PRODUCT DESIGNER",
            style: GoogleFonts.oswald(
              color: kPrimaryColor,
              fontWeight: FontWeight.w900,
              fontSize: 16.0,
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Text(
            "MICHELE\nHARRINGTON",
            style: GoogleFonts.oswald(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 50.0,
              height: 1.3,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Full-stack developer, based in Barcelona.\n",
                  style: TextStyle(
                    color: kCaptionColor,
                    fontSize: 16.0,
                  ),
                ),
                TextSpan(
                  text: "Need a fully custom website?",
                  style: TextStyle(
                    color: kCaptionColor,
                    height: 2.0,
                    fontSize: 16.0,
                  ),
                ),
                MouseRegionSpan(
                  mouseCursor: SystemMouseCursors.click,
                  inlineSpan: TextSpan(
                    text: "  Got a project? Let's talk.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  onTap: () {},
                )
              ],
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 28.0,
                vertical: 5.0,
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "GET STARTED",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  )
];
