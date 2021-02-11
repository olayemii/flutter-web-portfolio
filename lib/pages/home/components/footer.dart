import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sizer/sizer.dart';
import 'package:web_portfolio/utils/adaptive_layout.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: AdaptiveLayout(
        desktop: _buildDesktop(),
        tablet: _buildTablet(),
        mobile: _buildMobile(context),
      ),
    );
  }
}

Widget _buildDesktop() {
  return ResponsiveWrapper(
    maxWidth: 1000.0,
    minWidth: 1000.0,
    defaultScale: false,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 14.0),
      child: Column(
        children: [
          ResponsiveRowColumn(
            rowSpacing: 20.0,
            rowColumn: true,
            children: List.generate(4, (index) => _footerGridItem()).toList(),
          ),
          SizedBox(
            width: 20.0,
          ),
          _footerText(),
        ],
      ),
    ),
  );
}

Widget _buildTablet() {
  return ResponsiveWrapper(
    maxWidth: 760.0,
    minWidth: 760.0,
    defaultScale: false,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 14.0),
      height: 150.0,
      child: Column(
        children: [
          Expanded(
            child: ResponsiveRowColumn(
              rowSpacing: 20.0,
              rowColumn: true,
              children: List.generate(4, (index) => _footerGridItem()).toList(),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          _footerText(),
        ],
      ),
    ),
  );
}

Widget _buildMobile(context) {
  return ResponsiveWrapper(
    maxWidth: MediaQuery.of(context).size.width * 0.7,
    minWidth: MediaQuery.of(context).size.width * 0.7,
    defaultScale: false,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 14.0),
      height: 1000.0,
      child: Column(
        children: [
          Expanded(
            child: ResponsiveGridView.builder(
              gridDelegate: ResponsiveGridDelegate(
                maxCrossAxisExtent: 500.0,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 150.0,
                  color: Colors.red,
                );
              },
              itemCount: 4,
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          _footerText(true),
        ],
      ),
    ),
  );
}

ResponsiveRowColumnItem _footerGridItem() {
  return ResponsiveRowColumnItem(
    rowFlex: 1,
    child: Container(
      color: Colors.red,
      height: 50.0,
    ),
  );
}

Widget _footerText([bool isMobile = false]) {
  return Flex(
    direction: isMobile ? Axis.vertical : Axis.horizontal,
    crossAxisAlignment:
        isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.end,
    children: [
      Text(
        "Copyright © 2021 Michele Harrington. All rights Reserved.",
        style: TextStyle(
          color: Color(0xFFA6B1BB),
        ),
      ),
      isMobile
          ? SizedBox(
              height: 7.0,
            )
          : Spacer(),
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {},
          child: Text(
            "Privacy Policy",
            style: TextStyle(
              color: Color(0xFFA6B1BB),
            ),
          ),
        ),
      ),
      isMobile
          ? SizedBox(
              height: 7.0,
            )
          : Text(
              "   |   ",
              style: TextStyle(
                color: Color(0xFFA6B1BB),
              ),
            ),
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {},
          child: Text(
            "Terms & Conditions",
            style: TextStyle(
              color: Color(0xFFA6B1BB),
            ),
          ),
        ),
      ),
    ],
  );
}
