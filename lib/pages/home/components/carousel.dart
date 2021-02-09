import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:web_portfolio/utils/constants.dart';

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
          MediaQuery.of(context).size.height - 150.0,
        ),
      ),
      child: RepaintBoundary(
        child: Container(
          child: Row(
            children: [
              Expanded(
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
                            text: "Full-stack developer, based in Barcelona.\n",
                            style: TextStyle(
                              color: kCaptionColor,
                            ),
                          ),
                          TextSpan(
                              text: "Need a fully custom website?",
                              style: TextStyle()),
                          TextSpan(text: "Got a project? Let's talk.")
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
