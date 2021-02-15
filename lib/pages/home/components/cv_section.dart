import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_grid.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:web_portfolio/models/design_process.dart';
import 'package:web_portfolio/utils/screen_helper.dart';
import 'package:web_portfolio/utils/constants.dart';

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
      child: ScreenHelper(
        desktop: _buildUi(context, 1000.0),
        mobile: _buildUi(
          context,
          MediaQuery.of(context).size.width * 0.78,
          defaultScale: false,
        ),
        tablet: _buildUi(context, 760.0, defaultScale: true),
      ),
    );
  }
}

Widget _buildUi(BuildContext context, double width,
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
                    height: 1.8,
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
            Container(
              child: LayoutBuilder(builder: (_context, constraints) {
                return ResponsiveGridView.builder(
                  padding: EdgeInsets.all(0.0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  alignment: Alignment.topCenter,
                  gridDelegate: ResponsiveGridDelegate(
                    maxCrossAxisExtent: ScreenHelper.isTablet(context) ||
                            ScreenHelper.isMobile(context)
                        ? (constraints.maxWidth / 2.0 - 20.0)
                        : 250.0,
                    childAspectRatio: ScreenHelper.isDesktop(context)
                        ? 1
                        : MediaQuery.of(context).size.aspectRatio * 1.5,
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                              height: 1.5,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: designProcesses.length,
                );
              }),
            ),
          ],
        ),
      ),
    ),
  );
}
