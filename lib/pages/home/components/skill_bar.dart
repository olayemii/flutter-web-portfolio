import 'package:flutter/material.dart';
import 'package:web_portfolio/models/skill.dart';

class SkillBar extends StatelessWidget {
  final Skill skill;
  SkillBar({
    Key key,
    this.skill,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Expanded(
            flex: skill.percentage,
            child: Container(
              padding: EdgeInsets.only(left: 10.0),
              alignment: Alignment.centerLeft,
              height: 38.0,
              child: Text(skill.skill),
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            flex: (100 - skill.percentage),
            child: Divider(
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            "${skill.percentage}%",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          )
        ],
      ),
    );
  }
}
