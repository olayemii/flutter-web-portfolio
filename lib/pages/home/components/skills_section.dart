import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_row_column.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:web_portfolio/models/skill.dart';
import 'package:web_portfolio/pages/home/components/skill_bar.dart';
import 'package:web_portfolio/utils/adaptive_layout.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/mouse_region_span.dart';

class SkillSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      desktop: _buildUi(1000.0),
      tablet: _buildUi(760.0),
      mobile: _buildUi(MediaQuery.of(context).size.width * .8),
    );
  }
}

List<Skill> skills = [
  Skill(
    skill: "Dart",
    percentage: 62,
  ),
  Skill(
    skill: "Javascript",
    percentage: 80,
  ),
  Skill(
    skill: "PHP",
    percentage: 78,
  ),
  Skill(
    skill: "Python",
    percentage: 90,
  ),
  Skill(
    skill: "GoLang",
    percentage: 40,
  ),
];

Widget _buildUi(double width) {
  return Center(
    child: LayoutBuilder(builder: (context, constraints) {
      return ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: true,
        child: ResponsiveRowColumn(
          rowSpacing: 50.0,
          rowColumn: constraints.maxWidth > 720.0,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 2,
              child: Image.asset(
                "assets/person_small.png",
                width: 300.0,
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 4,
              child: RepaintBoundary(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "SKILLS",
                      style: GoogleFonts.oswald(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 35.0,
                        height: 1.3,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Faucibus sed tristique fames sed aliquet ultricies eget viverra arcu. Vitae faucibus diam consequat aecenas. Turpis metus sit diam purus leo varius. Nunc amet tristique estars",
                      style: TextStyle(
                        color: kCaptionColor,
                        height: 1.5,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Column(
                      children: skills
                          .map(
                            (e) => SkillBar(
                              skill: e,
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }),
  );
}
