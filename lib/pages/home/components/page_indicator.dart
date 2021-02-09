import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicator extends StatelessWidget {
  final ValueNotifier currentIndex;

  PageIndicator({Key key, this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
