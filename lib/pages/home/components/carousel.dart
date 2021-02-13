import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_framework/responsive_value.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:web_portfolio/pages/home/components/carousel_items.dart';
import 'package:web_portfolio/pages/home/components/page_indicator.dart';
import 'package:web_portfolio/utils/adaptive_layout.dart';

CarouselController carouselController = CarouselController();

class Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height *
        (AdaptiveLayout.isMobile(context) ? 0.7 : .85);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: containerHeight,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: CarouselSlider(
                  carouselController: carouselController,
                  options: CarouselOptions(
                    viewportFraction: 1.0,
                    scrollPhysics: NeverScrollableScrollPhysics(),
                    height: containerHeight,
                  ),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          child: AdaptiveLayout(
                            desktop: buildDesktop(
                              context,
                              carouselItems[0].text,
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: AssetImage(
                                      "assets/person.png",
                                    ),
                                  ),
                                ),
                                child: carouselItems[0].image,
                              ),
                            ),
                            tablet: buildTablet(
                              context,
                              carouselItems[0].text,
                              carouselItems[0].image,
                            ),
                            mobile: buildMobile(
                              context,
                              carouselItems[0].text,
                              carouselItems[0].image,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Positioned(
                right: 0.0,
                top: (MediaQuery.of(context).size.height - 150.0) / 2 - 70.0,
                child: ResponsiveVisibility(
                  visible: false,
                  visibleWhen: [Condition.largerThan(name: MOBILE)],
                  child: PageIndicator(
                    currentIndex: ValueNotifier(0),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

Widget buildDesktop(BuildContext context, Widget text, Widget image) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: 1000.0,
      minWidth: 1000.0,
      defaultScale: false,
      child: Row(
        children: [
          Expanded(
            child: text,
          ),
          Expanded(
            child: image,
          ),
        ],
      ),
    ),
  );
}

Widget buildMobile(BuildContext context, Widget text, Widget image) {
  return Container(
    constraints: BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width * 0.8,
    ),
    width: double.infinity,
    child: text,
  );
}

Widget buildTablet(BuildContext context, Widget text, Widget image) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: 760.0,
      minWidth: 760.0,
      defaultScale: false,
      child: Row(
        children: [
          Expanded(
            child: text,
          ),
          Expanded(
            child: image,
          ),
        ],
      ),
    ),
  );
}

// class PageChanger extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         MouseRegion(
//           cursor: SystemMouseCursors.click,
//           child: GestureDetector(
//             onTap: () {},
//             child: Icon(
//               FlutterIcons.caret_square_left_faw5,
//               color: kPrimaryColor,
//               size: 28.0,
//             ),
//           ),
//         ),
//         SizedBox(
//           width: 15.0,
//         ),
//         MouseRegion(
//           cursor: SystemMouseCursors.click,
//           child: GestureDetector(
//             onTap: () {
//               carouselController.nextPage();
//             },
//             child: Icon(
//               FlutterIcons.caret_square_right_faw5,
//               color: kPrimaryColor,
//               size: 28.0,
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
