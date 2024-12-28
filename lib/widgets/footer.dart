import 'package:flutter/material.dart';
import '../styles/theme.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: AppTheme.primaryColor,
      child: Center(
        child: Text(
          '© 2024 Website Replica. All rights reserved.',
          style: TextStyle(color: AppTheme.textColor, fontSize: 14),
        ),
      ),
    );
  }
}