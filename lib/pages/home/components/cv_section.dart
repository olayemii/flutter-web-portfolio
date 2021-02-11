import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_grid.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:web_portfolio/models/design_process.dart';
import 'package:web_portfolio/utils/adaptive_layout.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:sizer/sizer.dart';

List<DesignProcess> designProcesses = [
  DesignProcess(
    title: "DESIGN",
    imagePath: "assets/design.png",
    subtitle:
        "A full stack allaround designer that may or may not include a guide for specific createive",
  ),
  DesignProcess(
    title: "DEVELOP",
    imagePath: "assets/develop.png",
    subtitle:
        "Tellus pharetra erat tristique erat donec dignissim etiam sed malesuada enim sodales",
  ),
  DesignProcess(
    title: "WRITE",
    imagePath: "assets/write.png",
    subtitle:
        "A full stack allaround designer that may or may not include a guide for specific createive",
  ),
  DesignProcess(
    title: "PROMOTE",
    imagePath: "assets/promote.png",
    subtitle:
        "Tellus pharetra erat tristique erat donec dignissim etiam sed malesuada enim sodales",
  )
];

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
            SizedBox(
              height: 50.0,
            ),
            ResponsiveGridView.builder(
              shrinkWrap: true,
              alignment: Alignment.center,
              gridDelegate: ResponsiveGridDelegate(
                maxCrossAxisExtent: 250.0,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
                childAspectRatio: 1.5,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            designProcesses[index].imagePath,
                            width: 40.0,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            designProcesses[index].title,
                            style: GoogleFonts.oswald(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        designProcesses[index].subtitle,
                        style: TextStyle(
                          color: Color(0xFFA6B1BB),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: designProcesses.length,
            ),
          ],
        ),
      ),
    ),
  );
}
