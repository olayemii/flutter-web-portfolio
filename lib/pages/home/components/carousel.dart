import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/mouse_region_span.dart';

class Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      maxWidth: 1200,
      minWidth: 1200,
      defaultScale: true,
      mediaQueryData: MediaQueryData(
        size: Size(
          1200,
          MediaQuery.of(context).size.height - 200.0,
        ),
      ),
      child: RepaintBoundary(
        child: Container(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50.0),
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
                        height: 10.0,
                      ),
                      Text(
                        "MICHELE\nHARRINGTON",
                        style: GoogleFonts.oswald(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 50.0,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  "Full-stack developer, based in Barcelona.\n",
                              style: TextStyle(
                                color: kCaptionColor,
                              ),
                            ),
                            TextSpan(
                              text: "Need a fully custom website?",
                              style: TextStyle(
                                color: kCaptionColor,
                                height: 1.8,
                                fontSize: 14.0,
                              ),
                            ),
                            MouseRegionSpan(
                              mouseCursor: SystemMouseCursors.click,
                              inlineSpan: TextSpan(
                                text: "  Got a project? Let's talk.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                ),
                              ),
                              onTap: () {},
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
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
              ),
              Expanded(
                child: Container(
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
