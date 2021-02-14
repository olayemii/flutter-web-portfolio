import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/testimonial.dart';
import 'package:web_portfolio/utils/adaptive_layout.dart';
import 'package:web_portfolio/utils/constants.dart';

List<TestimonialModel> testimonials = [
  TestimonialModel(
    text:
        "Rob Davidson is daucibus sed tristique fames sed aliquet ultricies eget viverra arcu vitae faucibus diam consequat maecenas turpis metus sit diam purus leo in varius.",
    occupation: "Product Designer",
    personName: "JANNY STONE",
    profilePhoto: "assets/female.png",
  ),
  TestimonialModel(
    text:
        "Daucibus sed tristique fames sed aliquet ultricies eget viverra arcu vitae faucibus diam consequat maecenas turpis metus sit diam purus leo in varius retriko sedum est istera.",
    occupation: "Art Director",
    personName: "KEN WILLIAMS",
    profilePhoto: "assets/male.png",
  ),
];

class Testimonial extends StatelessWidget {
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
            "TESTIMONIALS",
            style: GoogleFonts.oswald(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 30.0,
              height: 1.3,
            ),
          ),
          SizedBox(height: 5.0),
          // Text(
          //   "A full stack allaround designer that tristique est placerat\nin massa consectetur quisque lobortis vitae faucibus diam",
          //   style: TextStyle(
          //     color: Colors.white,
          //     height: 1.5,
          //   ),
          // ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text:
                      "Turpis metus sit diam purus leo varius. Nunc amet tristique",
                  style: TextStyle(
                    color: Colors.white,
                    height: 1.8,
                  ),
                ),
                TextSpan(
                  text: " estars\nadipiscing vulputate ",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: "est phasellus. Volutpat faucibus per.",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 45.0),
          Container(
            child: ResponsiveGridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              alignment: Alignment.center,
              gridDelegate: ResponsiveGridDelegate(
                maxCrossAxisExtent: 500.0,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Image.asset(
                          "assets/quote.png",
                          width: 50.0,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        testimonials[index].text,
                        style: TextStyle(
                          color: Colors.white,
                          height: 1.8,
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
                              testimonials[index].profilePhoto,
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                testimonials[index].personName,
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
                                testimonials[index].occupation,
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
              itemCount: testimonials.length,
            ),
          ),
        ],
      ),
    ),
  );
}
