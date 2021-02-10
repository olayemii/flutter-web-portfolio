import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:web_portfolio/utils/adaptive_layout.dart';
import 'package:web_portfolio/utils/constants.dart';

class CvSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: AdaptiveLayout(
        desktop: _buildDesktop(context, 1000.0),
        mobile: _buildDesktop(
          context,
          MediaQuery.of(context).size.width * 0.7,
          defaultScale: false,
        ),
        tablet: _buildDesktop(context, 760.0, defaultScale: true),
      ),
    );
  }
}

Widget _buildDesktop(BuildContext context, double width,
    {bool defaultScale = true}) {
  return ResponsiveWrapper(
    maxWidth: width,
    minWidth: width,
    defaultScale: defaultScale,
    child: Container(
      // padding: const EdgeInsets.only(left: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "BETTER DESIGN,\nBETTER EXPERIENCES",
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 34.0,
                  height: 1.3,
                ),
              ),
              Text(
                "DOWNLOAD CV",
                style: GoogleFonts.oswald(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
