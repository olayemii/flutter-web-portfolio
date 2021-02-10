import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:web_portfolio/utils/adaptive_layout.dart';

class CvSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      width: MediaQuery.of(context).size.width,
      child: AdaptiveLayout(
        desktop: _buildDesktop(context),
        mobile: _buildDesktop(context),
        tablet: _buildDesktop(context),
      ),
    );
  }
}

Widget _buildDesktop(BuildContext context) {
  return ResponsiveWrapper(
    maxWidth: 1400.0,
    minWidth: 1400.0,
    defaultScale: true,
    child: Container(
      color: Colors.red,
      // padding: const EdgeInsets.only(left: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "BETTER DESIGN,\nBETTER EXPERIENCES",
            style: GoogleFonts.oswald(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 40.0,
              height: 1.3,
            ),
          ),
        ],
      ),
    ),
  );
}
