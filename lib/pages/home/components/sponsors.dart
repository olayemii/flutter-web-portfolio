import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

List<String> sponsorsLogo = [
  "assets/brand1.png",
  "assets/brand2.png",
  "assets/brand3.png",
  "assets/brand4.png",
  "assets/brand5.png",
];

class Sponsors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50.0),
      child: ScreenHelper(
        desktop: _buildUi(1000.0),
        tablet: _buildUi(800.0),
        mobile: _buildUi(MediaQuery.of(context).size.width * .8),
      ),
    );
  }
}

Widget _buildUi(double width) {
  return Center(
    child: ResponsiveWrapper(
      minWidth: width,
      maxWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Wrap(
            spacing: 50.0,
            runSpacing: 50.0,
            children: sponsorsLogo
                .map(
                  (logo) => Container(
                    height: 20.0,
                    child: Image.asset(
                      logo,
                    ),
                    constraints: BoxConstraints(
                      maxWidth: ScreenHelper.isMobile(context)
                          ? constraints.maxWidth / 3.0 - 50.0
                          : constraints.maxWidth / 5.0 - 50.0,
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    ),
  );
}
