import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

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
          color: Colors.red,
        ),
      ),
    );
  }
}
