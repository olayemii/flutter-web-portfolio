import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:web_portfolio/pages/home/components/carousel_item.dart';
import 'package:web_portfolio/pages/home/components/page_indicator.dart';
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
                            return CarouselItem();
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  PageIndicator(currentIndex: currentIndex),
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
