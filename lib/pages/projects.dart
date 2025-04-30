import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../styles/theme.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 800;
          return Center(
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                _buildProjectCard(
                  context,
                  title: 'eMotion: Kinesthetic Analysis System',
                  technologies: [
                    {'name': 'Flutter/Dart', 'color': Colors.blue},
                    {'name': 'Supabase', 'color': Colors.orange},
                  ],
                  description:
                      'Mobile application designed to detect and analyze emotions through body movements.',
                  images: [
                    'assets/images/tracking.jpg',
                    'assets/images/analytics.jpg',
                  ],
                  githubLink: 'https://github.com/Kristoferseyan/eMotion.git',
                  isMobile: isMobile,
                  isMobileApp: true,
                ),
                _buildProjectCard(
                  context,
                  title: 'Tascadia',
                  technologies: [
                    {'name': 'Flutter/Dart', 'color': Colors.blue},
                    {'name': 'Supabase', 'color': Colors.orange},
                  ],
                  description:
                      'TasCadia is a mobile app that connects busy people who need help with tasks like errands, cleaning, or deliveries to individuals looking for flexible side jobs.',
                  images: [
                    'assets/images/tascadia-dash.jpg',
                    'assets/images/tascadia-login.jpg',
                  ],
                  githubLink: 'https://github.com/Kristoferseyan/Tascadia.git',
                  isMobile: isMobile,
                  isMobileApp: true,
                ),
                _buildProjectCard(
                  context,
                  title: 'Oro Computer Center Management System',
                  technologies: [
                    {'name': 'Flutter/Dart', 'color': Colors.blue},
                    {'name': 'Supabase', 'color': Colors.orange},
                  ],
                  description:
                      'Desktop application that will serve as a management system for Oro Computer Center.',
                  images: [
                    'assets/images/oro_home.png',
                    'assets/images/oro_items.png',
                  ],
                  githubLink:
                      'https://github.com/Kristoferseyan/oro-computer-system',
                  isMobile: isMobile,
                  isMobileApp: false,
                ),
                _buildProjectCard(
                  context,
                  title: 'Canteen Management System',
                  technologies: [
                    {'name': 'Flutter/Dart', 'color': Colors.blue},
                    {'name': 'MySQL', 'color': Colors.orange.shade700},
                    {'name': 'ASP.NET', 'color': Colors.purple},
                  ],
                  description:
                      'This project is part of my learning journey, integrating an ASP.NET backend with Flutter for the first time. It also serves as a proposal for my host company, showcasing how a digital solution can enhance canteen services.',
                  images: [
                    'assets/images/landingpage.png',
                    'assets/images/employee_menu_page.png',
                    'assets/images/employee_order_page.png',
                  ],
                  githubLink: 'https://github.com/Kristoferseyan/canteen-frontend',
                  isMobile: isMobile,
                  isMobileApp: false,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProjectCard(
    BuildContext context, {
    required String title,
    required List<Map<String, dynamic>> technologies,
    required String description,
    required List<String> images,
    required String githubLink,
    required bool isMobile,
    bool isMobileApp = true,
  }) {
    return isMobileApp
        ? _buildMobileAppCard(
            context,
            title: title,
            technologies: technologies,
            description: description,
            images: images,
            githubLink: githubLink,
            isMobile: isMobile,
          )
        : _buildDesktopAppCard(
            context,
            title: title,
            technologies: technologies,
            description: description,
            images: images,
            githubLink: githubLink,
            isMobile: isMobile,
          );
  }

  Widget _buildMobileAppCard(
    BuildContext context, {
    required String title,
    required List<Map<String, dynamic>> technologies,
    required String description,
    required List<String> images,
    required String githubLink,
    required bool isMobile,
  }) {
    return Container(
      width: isMobile ? double.infinity : 380,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppTheme.cardColorDark,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 380,
              color: Colors.black,
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Container(
                          height: 340,
                          width: 180,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: Colors.grey.shade800,
                              width: 10,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 20,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.asset(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.phone_android,
                            color: Colors.white,
                            size: 16,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Mobile App',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (images.length > 1)
                    Positioned(
                      bottom: 16,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          images.length,
                          (index) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: technologies.map((tech) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: tech['color'].withOpacity(0.15),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: tech['color'].withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          tech['name'],
                          style: TextStyle(
                            color: tech['color'].withOpacity(0.9),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 16,
                      height: 1.6,
                      letterSpacing: 0.3,
                    ),
                  ),
                  SizedBox(height: 24),
                  _buildGithubButton(githubLink),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopAppCard(
    BuildContext context, {
    required String title,
    required List<Map<String, dynamic>> technologies,
    required String description,
    required List<String> images,
    required String githubLink,
    required bool isMobile,
  }) {
    return Container(
      width: isMobile ? double.infinity : 480,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppTheme.cardColorDark,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 320,
              color: Color(0xFF121212),
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.grey.shade800,
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 10,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.asset(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.desktop_windows,
                            color: Colors.white,
                            size: 16,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Desktop App',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        width: 100,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (images.length > 1)
                    Positioned(
                      bottom: 30,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          images.length,
                          (index) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: technologies.map((tech) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: tech['color'].withOpacity(0.15),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: tech['color'].withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          tech['name'],
                          style: TextStyle(
                            color: tech['color'].withOpacity(0.9),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 16,
                      height: 1.6,
                      letterSpacing: 0.3,
                    ),
                  ),
                  SizedBox(height: 24),
                  _buildGithubButton(githubLink),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGithubButton(String githubLink) {
    return ElevatedButton(
      onPressed: () async {
        if (await canLaunchUrl(Uri.parse(githubLink))) {
          await launchUrl(Uri.parse(githubLink));
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primaryColorDark,
        foregroundColor: Colors.white,
        elevation: 0,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/github.png',
            height: 24,
            width: 24,
            color: Colors.white,
          ),
          SizedBox(width: 12),
          Text(
            'View on GitHub',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
