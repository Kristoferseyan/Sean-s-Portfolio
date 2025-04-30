// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio/pages/content-widgets/left_section.dart';
import 'package:portfolio/pages/content-widgets/right_section.dart';
import '../../styles/theme.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWideScreen = constraints.maxWidth > 1000;
        bool isMediumScreen =
            constraints.maxWidth > 600 && constraints.maxWidth <= 1000;
        bool isSmallScreen = constraints.maxWidth <= 600;

        double leftSectionWidth = isWideScreen
            ? constraints.maxWidth / 2.3
            : (isMediumScreen ? constraints.maxWidth / 2.5 : double.infinity);

        return Scaffold(
          backgroundColor: AppTheme.backgroundColorDark,
          body: isWideScreen || isMediumScreen
              ? Row(
                  children: [
                    Center(
                      child: SizedBox(
                        width: leftSectionWidth,
                        height: double.infinity,
                        child: LeftSection(
                          isWideScreen: isWideScreen,
                          isMediumScreen: isMediumScreen,
                          isSmallScreen: isSmallScreen,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.zero,
                          physics: BouncingScrollPhysics(),
                          child: RightSection(
                            isWideScreen: isWideScreen,
                            isMediumScreen: isMediumScreen,
                            isSmallScreen: isSmallScreen,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 300,
                      child: LeftSection(
                        isWideScreen: isWideScreen,
                        isMediumScreen: isMediumScreen,
                        isSmallScreen: isSmallScreen,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: AppTheme.subtleGradient,
                        ),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: RightSection(
                            isWideScreen: isWideScreen,
                            isMediumScreen: isMediumScreen,
                            isSmallScreen: isSmallScreen,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
