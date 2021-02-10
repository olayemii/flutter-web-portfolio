import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:web_portfolio/utils/adaptive_layout.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:sizer/sizer.dart';

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
    child: RepaintBoundary(
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
                    fontSize: 12.0.sp,
                    height: 1.3,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Text(
                      "DOWNLOAD CV",
                      style: GoogleFonts.oswald(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 70.0,
              child: Wrap(
                runAlignment: WrapAlignment.spaceBetween,
                children: List.generate(
                  4,
                  (index) => Container(
                    color: Colors.red,
                    width: width / 4 - 50.0,
                    margin: EdgeInsets.only(right: 25.0),
                    child: Text("Hello World"),
                    height: 80.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
