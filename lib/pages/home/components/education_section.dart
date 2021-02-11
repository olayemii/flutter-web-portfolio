import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/education.dart';
import 'package:web_portfolio/utils/adaptive_layout.dart';

List<Education> educations = [
  Education(
    description:
        "Faucibus sed tristique fames sed aliquet ultricies eget viverra arcu vitae faucibus diam consequat.",
    linkName: "www.fakewebsite.com",
    period: "2019 - PRESENT",
  ),
  Education(
    description:
        "Sed eu risus dignissim sapien sollicitudin sceleri vamus cursus purus eget ligula lorem ipsum.",
    linkName: "www.fakewebsite.com",
    period: "2018 - 2019",
  ),
  Education(
    description:
        "Aliquam nec tortor non dolor sagittis accumsan. Vivamus tristique metus et venenatis pull.",
    linkName: "www.fakewebsite.com",
    period: "2017 - 2018",
  ),
  Education(
    description:
        "Molestie, a laoreet urna tempor vivamus vel gravida augue, quis imperdiet sem etiam sedio.",
    linkName: "www.fakewebsite.com",
    period: "2016 - 2017",
  )
];

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
          SizedBox(height: 40.0),
          LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                child: ResponsiveGridView.builder(
                  shrinkWrap: true,
                  alignment: Alignment.center,
                  gridDelegate: ResponsiveGridDelegate(
                    maxCrossAxisExtent: constraints.maxWidth / 2.0,
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                    childAspectRatio: 2.8,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            educations[index].period,
                            style: GoogleFonts.oswald(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 25.0,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage(
                                  "assets/male.png",
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Olayemii Garuba",
                                    style: GoogleFonts.oswald(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    "Local Man",
                                    style: TextStyle(
                                      color: Color(0xFFA6B1BB),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: educations.length,
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}
