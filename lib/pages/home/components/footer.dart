import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sizer/sizer.dart';
import 'package:web_portfolio/utils/adaptive_layout.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      width: MediaQuery.of(context).size.width,
      child: AdaptiveLayout(
        desktop: _buildDesktop(),
        tablet: _buildDesktop(),
        mobile: _buildDesktop(),
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
      height: 150.0,
      child: Column(
        children: [
          Expanded(
            child: SizedBox(),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Copyright © 2021 Michele Harrington. All rights Reserved.",
                style: TextStyle(
                  color: Color(0xFFA6B1BB),
                ),
              ),
              Spacer(),
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
              Text(
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
          ),
        ],
      ),
    ),
  );
}
