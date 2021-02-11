import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
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
      desktop: _buildDesktop(),
      mobile: _buildDesktop(),
      tablet: _buildDesktop(),
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

Widget _buildDesktop() {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: 1000.0,
      minWidth: 1000.0,
      defaultScale: false,
      child: Row(
        children: [
          Expanded(
            child: Wrap(
              children: [
                Image.asset(
                  "assets/person_small.png",
                  width: 400.0,
                  height: 400.0,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
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
    ),
  );
}
