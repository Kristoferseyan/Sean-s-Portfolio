

import 'package:flutter/material.dart';
import 'package:portfolio/styles/theme.dart';

class SkillTooltip extends StatelessWidget {
  final String skill;
  final String description;
  final Image image;
  final Color color;

  const SkillTooltip({super.key, 
    required this.skill,
    required this.description,
    required this.image,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: description,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: AppTheme.cardColorDark, 
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      textStyle: const TextStyle(
        color: Colors.white, 
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      child: Chip(
        avatar: CircleAvatar(
          backgroundColor: color,
          child: Image(image: image.image),
        ),
        label: Text(
          skill,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: color.withOpacity(0.1),
      ),
    );
  }
}
