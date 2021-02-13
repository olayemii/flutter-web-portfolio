import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:web_portfolio/utils/adaptive_layout.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/mouse_region_span.dart';

class IosAppAd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      desktop: _buildUi(1000.0),
      tablet: _buildUi(760.0),
      mobile: _buildUi(MediaQuery.of(context).size.width * .8),
    );
  }
}

Widget _buildUi(double width) {
  return Center(
    child: LayoutBuilder(builder: (context, constraints) {
      return ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: ResponsiveRowColumn(
          rowColumn: constraints.maxWidth > 720.0,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: Image.asset("assets/ios.png"),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: RepaintBoundary(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "IOS APP",
                      style: GoogleFonts.oswald(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "UNIVERSAL\nSMART HOME APP",
                      style: GoogleFonts.oswald(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 35.0,
                        height: 1.3,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Faucibus sed tristique fames sed aliquet ultricies eget viverra arcu. Vitae faucibus diam consequat aecenas. Turpis metus sit diam purus leo varius. Nunc amet tristique estars Volutpat faucibus per praesent actual state.",
                      style: TextStyle(
                        color: kCaptionColor,
                        height: 1.5,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            height: 48.0,
                            padding: EdgeInsets.symmetric(
                              horizontal: 28.0,
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: Center(
                                child: Text(
                                  "EXPLORE MORE",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: kPrimaryColor,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            height: 48.0,
                            padding: EdgeInsets.symmetric(
                              horizontal: 28.0,
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: Center(
                                child: Text(
                                  "NEXT APP",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }),
  );
}
