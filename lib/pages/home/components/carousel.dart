import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/mouse_region_span.dart';

ValueNotifier currentIndex = ValueNotifier(0);
CarouselController controller = CarouselController();

class Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      maxWidth: 1000.0,
      minWidth: 1000.0,
      defaultScale: true,
      mediaQueryData: MediaQueryData(
        size: Size(
          1000.0,
          MediaQuery.of(context).size.height - 200.0,
        ),
      ),
      child: RepaintBoundary(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CarouselSlider(
                      carouselController: controller,
                      options: CarouselOptions(
                        viewportFraction: 1.0,
                        scrollPhysics: NeverScrollableScrollPhysics(),
                      ),
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 50.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            height: 30.0,
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
                                                  text:
                                                      "Full-stack developer, based in Barcelona.\n",
                                                  style: TextStyle(
                                                    color: kCaptionColor,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      "Need a fully custom website?",
                                                  style: TextStyle(
                                                    color: kCaptionColor,
                                                    height: 2.0,
                                                    fontSize: 14.0,
                                                  ),
                                                ),
                                                MouseRegionSpan(
                                                  mouseCursor:
                                                      SystemMouseCursors.click,
                                                  inlineSpan: TextSpan(
                                                    text:
                                                        "  Got a project? Let's talk.",
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
                                            height: 25.0,
                                          ),
                                          MouseRegion(
                                            cursor: SystemMouseCursors.click,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: kPrimaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                                      child: Image.asset(
                                        "assets/person.png",
                                        width: 100.0,
                                        height: 500.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ValueListenableBuilder(
                      valueListenable: currentIndex,
                      builder: (context, value, child) {
                        return AnimatedSmoothIndicator(
                          axisDirection: Axis.vertical,
                          activeIndex: value,
                          count: 5,
                          effect: ExpandingDotsEffect(
                            dotWidth: 10.0,
                            expansionFactor: 5.0,
                            dotHeight: 6.0,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 50.0,
              ),
              child: ValueListenableBuilder(
                  valueListenable: currentIndex,
                  builder: (context, value, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              if (value > 0) {
                                controller.animateToPage(
                                  value - 1,
                                  duration: Duration(
                                    milliseconds: 450,
                                  ),
                                  curve: Curves.easeIn,
                                );
                                currentIndex.value = value - 1;
                              }
                            },
                            child: Icon(
                              FlutterIcons.caret_square_left_faw5,
                              color: kPrimaryColor,
                              size: 28.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              print(value + 1);
                              if (value < 4) {
                                controller.animateToPage(
                                  value + 1,
                                  duration: Duration(
                                    milliseconds: 450,
                                  ),
                                  curve: Curves.easeIn,
                                );
                                currentIndex.value = value + 1;
                              }
                            },
                            child: Icon(
                              FlutterIcons.caret_square_right_faw5,
                              color: kPrimaryColor,
                              size: 28.0,
                            ),
                          ),
                        )
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
