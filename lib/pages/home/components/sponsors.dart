import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_grid.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

List<String> items = [
  "assets/brand1.png",
  "assets/brand2.png",
  "assets/brand3.png",
  "assets/brand4.png",
  "assets/brand5.png",
];

class Sponsors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      mobile: _buildContent(MediaQuery.of(context).size.width * .8),
      tablet: _buildContent(760.0),
      desktop: _buildContent(1000.0),
    );
  }
}

Widget _buildContent(double width) {
  return Container(
    alignment: Alignment.center,
    child: ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: Container(
        child: ResponsiveGridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.all(0.0),
          alignment: Alignment.center,
          gridDelegate: ResponsiveGridDelegate(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              child: Wrap(
                children: [
                  Image.asset(
                    items[index],
                    width: 100.0,
                  ),
                ],
              ),
            );
          },
          itemCount: items.length,
        ),
      ),
    ),
  );
}
