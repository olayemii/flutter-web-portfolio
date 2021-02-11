import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/utils/adaptive_layout.dart';

class EducationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobile: _buildContent(MediaQuery.of(context).size.width * .7),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "EDUCATION",
            style: GoogleFonts.oswald(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 30.0,
              height: 1.3,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            "A full stack allaround designer that tristique est placerat\nin massa consectetur quisque lobortis vitae faucibus diam",
            style: TextStyle(
              color: Colors.white,
              height: 1.5,
            ),
          ),
          SizedBox(height: 15.0),
          Container(
            child: ResponsiveGridView.builder(
              shrinkWrap: true,
              alignment: Alignment.center,
              gridDelegate: ResponsiveGridDelegate(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.red,
                );
              },
              itemCount: 4,
            ),
          ),
        ],
      ),
    ),
  );
}
