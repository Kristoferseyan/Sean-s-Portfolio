import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';
import '../styles/theme.dart';

class ProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(40.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Expanded(
            flex: 1, 
            child: SizedBox(
              height: 600,
              child: FadeInLeft(
                child: _buildProjectCard(
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
                ),
              ),
            ),
          ),
          SizedBox(width: 32), 
          
          Expanded(
            flex: 1, 
            child: SizedBox(
              height: 600,
              child: FadeInRight(
                child: _buildProjectCard(
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
                ),
              ),
            ),
          ),
          SizedBox(width: 32), 
          
          Expanded(
            flex: 1, 
            child: SizedBox(
              height: 600,
              child: FadeInRight(
                child: _buildProjectCard(
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
                  githubLink: 'https://github.com/Kristoferseyan/oro-computer-system',
                ),
              ),
            ),
          ),
        ],
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
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Row(
              children: images.map((imagePath) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _showImageDialog(context, imagePath);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Container(
                        height: 300, 
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            
            Text(
              title,
              style: TextStyle(
                color: AppTheme.textColor,
                fontSize: 24, 
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            
            Wrap(
              spacing: 8.0,
              children: technologies.map((tech) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: tech['color'].withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    tech['name'],
                    style: TextStyle(
                      color: tech['color'],
                      fontSize: 16, 
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 8),
            
            Text(
              description,
              style: TextStyle(
                color: AppTheme.textColor.withOpacity(0.8),
                fontSize: 18, 
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            
            ElevatedButton(
              onPressed: () async {
                if (await canLaunchUrl(Uri.parse(githubLink))) {
                  await launchUrl(Uri.parse(githubLink));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'View on GitHub',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.black.withOpacity(0.8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Close',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
