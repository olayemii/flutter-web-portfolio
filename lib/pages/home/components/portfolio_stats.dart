import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_grid.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:web_portfolio/models/stat.dart';
import 'package:web_portfolio/utils/adaptive_layout.dart';

class PortfolioStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobile: _buildContent(MediaQuery.of(context).size.width * .7),
      tablet: _buildContent(760.0),
      desktop: _buildContent(1000.0),
    );
  }
}

List<Stat> stats = [
  Stat(
    title: "Clients",
    count: "43",
  ),
  Stat(
    title: "Projects",
    count: "68+",
  ),
  Stat(
    title: "Awards",
    count: "17",
  ),
  Stat(
    title: "Years\nExperience",
    count: "10",
  ),
];
Widget _buildContent(double width) {
  return LayoutBuilder(
    builder: (context, constraints) {
      return Container(
        alignment: Alignment.center,
        child: ResponsiveWrapper(
          maxWidth: width,
          minWidth: width,
          defaultScale: false,
          child: Container(
            child: ResponsiveGridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              alignment: Alignment.center,
              gridDelegate: ResponsiveGridDelegate(
                childAspectRatio: 1.8,
                maxCrossAxisExtent: AdaptiveLayout.isMobile(context)
                    ? (constraints.maxWidth / 2.0 - 20.0)
                    : (constraints.maxWidth / 4.0 - 20.0),
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${stats[index].count}",
                        style: GoogleFonts.oswald(
                          fontWeight: FontWeight.w700,
                          fontSize: 32.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        " ${stats[index].title}",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xFFA6B1BB),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: stats.length,
            ),
          ),
        ),
      );
    },
  );
}
