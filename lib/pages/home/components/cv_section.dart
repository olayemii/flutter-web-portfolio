import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CvSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
