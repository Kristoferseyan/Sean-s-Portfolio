

import 'package:flutter/material.dart';

class SkillTooltip extends StatelessWidget {
  final String skill;
  final String description;
  final IconData icon;
  final Color color;

  SkillTooltip({
    required this.skill,
    required this.description,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: description,
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: color, 
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      textStyle: TextStyle(
        color: Colors.white, 
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      child: Chip(
        avatar: CircleAvatar(
          backgroundColor: color,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        label: Text(
          skill,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: color.withOpacity(0.1),
      ),
    );
  }
}
