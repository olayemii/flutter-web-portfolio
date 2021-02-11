import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sizer/sizer.dart';
import 'package:web_portfolio/models/footer_item.dart';
import 'package:web_portfolio/utils/adaptive_layout.dart';

List<FooterItem> footerItems = [
  FooterItem(
    iconPath: "assets/mappin.png",
    title: "ADDRESS",
    text1: "999 Carter Street",
    text2: "Sailor Springs, IL 62434",
  ),
  FooterItem(
    iconPath: "assets/phone.png",
    title: "PHONE",
    text1: "+1 618-689-9409",
    text2: "+1 781-254-8437",
  ),
  FooterItem(
    iconPath: "assets/email.png",
    title: "EMAIL",
    text1: "hello@example.com",
    text2: "support@example.com",
  ),
  FooterItem(
    iconPath: "assets/whatsapp.png",
    title: "WHATSAPP CHAT",
    text1: "+1 618-689-9409",
  )
];

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
      height: 200.0,
      padding: EdgeInsets.symmetric(vertical: 14.0),
      child: Column(
        children: [
          Expanded(
            child: ResponsiveRowColumn(
              rowSpacing: 20.0,
              rowColumn: true,
              children: List.generate(
                4,
                (index) => _footerGridItem(
                  item: footerItems[index],
                ),
              ).toList(),
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

Widget _buildTablet() {
  return ResponsiveWrapper(
    maxWidth: 760.0,
    minWidth: 760.0,
    defaultScale: false,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 14.0),
      height: 200.0,
      child: Column(
        children: [
          Expanded(
            child: ResponsiveRowColumn(
              rowSpacing: 20.0,
              rowColumn: true,
              children: List.generate(
                4,
                (index) => _footerGridItem(
                  item: footerItems[index],
                ),
              ).toList(),
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
      child: Column(
        children: [
          ResponsiveGridView.builder(
            shrinkWrap: true,
            alignment: Alignment.center,
            gridDelegate: ResponsiveGridDelegate(
              maxCrossAxisExtent: 250.0,
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
              childAspectRatio: 1.5,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          footerItems[index].iconPath,
                          width: 25.0,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          footerItems[index].title,
                          style: GoogleFonts.oswald(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15.0),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: footerItems[index].text1 + "\n",
                            style: TextStyle(
                              color: Color(0xFFA6B1BB),
                            ),
                          ),
                          TextSpan(
                            text: footerItems[index].text1,
                            style: TextStyle(
                              color: Color(0xFFA6B1BB),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: 4,
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

ResponsiveRowColumnItem _footerGridItem({@required FooterItem item}) {
  return ResponsiveRowColumnItem(
    rowFlex: 1,
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                item.iconPath,
                width: 25.0,
              ),
              SizedBox(
                width: 15.0,
              ),
              Text(
                item.title,
                style: GoogleFonts.oswald(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              )
            ],
          ),
          SizedBox(height: 15.0),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: item.text1 + "\n",
                  style: TextStyle(
                    color: Color(0xFFA6B1BB),
                  ),
                ),
                TextSpan(
                  text: item.text1,
                  style: TextStyle(
                    color: Color(0xFFA6B1BB),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      height: 200.0,
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
