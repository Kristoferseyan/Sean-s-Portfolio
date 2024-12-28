// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 
import '../styles/theme.dart';
import 'hover_tooltip.dart'; 

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWideScreen = constraints.maxWidth > 1000;

        return Row(
          children: [
            
            Container(
              width: isWideScreen
                  ? 700
                  : constraints.maxWidth * 0.6, 
              color: AppTheme.backgroundColor, 
              padding: EdgeInsets.fromLTRB(130.0, 40.0, 20.0, 40.0), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  CircleAvatar(
                    radius: isWideScreen ? 80 : 50, 
                    backgroundImage: AssetImage('assets/images/sean.jpg'), 
                  ),
                  SizedBox(height: isWideScreen ? 24 : 16),
                  
                  Text(
                    'Sean Nuevo',
                    style: TextStyle(
                      color: AppTheme.textColor,
                      fontSize: isWideScreen ? 32 : 24, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Student/Full Stack Developer',
                    style: TextStyle(
                      color: AppTheme.textColor.withOpacity(0.7),
                      fontSize: isWideScreen ? 20 : 16, 
                    ),
                  ),
                  SizedBox(height: isWideScreen ? 24 : 16),
                  
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: Colors.redAccent,
                        size: isWideScreen ? 24 : 18, 
                      ),
                      SizedBox(width: 8),
                      Text(
                        'South Cotabato, Philippines',
                        style: TextStyle(
                          color: AppTheme.textColor.withOpacity(0.8),
                          fontSize: isWideScreen ? 18 : 14, 
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: isWideScreen ? 24 : 16),
                  
                  Text(
                    'Building innovative solutions for real-world challenges. Passionate about crafting seamless digital experiences.',
                    style: TextStyle(
                      color: AppTheme.textColor.withOpacity(0.8),
                      fontSize: isWideScreen ? 18 : 14, 
                    ),
                  ),
                  SizedBox(height: isWideScreen ? 24 : 16),
                  // Buttons
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          final url = Uri.parse('https://resume92.tiiny.site');
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url, mode: LaunchMode.externalApplication);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Could not download the resume.')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                            horizontal: isWideScreen ? 30 : 20,
                            vertical: isWideScreen ? 15 : 10,
                          ), 
                        ),
                        child: Text(
                          'Resume',
                          style: TextStyle(fontSize: isWideScreen ? 18 : 14, color: Colors.white), 
                        ),
                      ),
                      SizedBox(width: 16),
                      IconButton(
                        onPressed: () async {
                          final url = Uri.parse('https://www.facebook.com/sean.nuevo.52');
                          if (await canLaunch(url.toString())) {
                            await launch(url.toString());
                          }
                        },
                        icon: Image.asset(
                          'assets/images/fb.png',
                          height: isWideScreen ? 28 : 20,
                          width: isWideScreen ? 28 : 20,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          final url = Uri.parse('https://github.com/Kristoferseyan');
                          if (await canLaunch(url.toString())) {
                            await launch(url.toString());
                          }
                        },
                        icon: Image.asset(
                          'assets/images/github.png',
                          height: isWideScreen ? 28 : 20,
                          width: isWideScreen ? 28 : 20,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),

            // Scrollable Right Section
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(40.0, 40.0, 130.0, 40.0), 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Text(
                        'About Me',
                        style: TextStyle(
                          color: AppTheme.textColor,
                          fontSize: isWideScreen ? 32 : 24, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: isWideScreen ? 24 : 16),
                      Text(
                        'I’m a graduating Computer Science student with a passion for solving real-world problems. '
                        'My expertise spans software development, system design, and data analysis, enabling me to craft impactful solutions. '
                        'I thrive in collaborative environments where I can apply innovative thinking to drive meaningful results.',
                        style: TextStyle(
                          color: AppTheme.textColor.withOpacity(0.8),
                          fontSize: isWideScreen ? 18 : 14, 
                          height: 1.5,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: isWideScreen ? 32 : 24),
                      
                      Text(
                        'Skills',
                        style: TextStyle(
                          color: AppTheme.textColor,
                          fontSize: isWideScreen ? 32 : 24, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: isWideScreen ? 24 : 16),
                      Wrap(
                        spacing: 16.0,
                        runSpacing: 12.0,
                        children: [
                          SkillTooltip(skill: 'Flutter/Dart', description: 'I have extensive experience using Flutter and Dart, which I relied on heavily to develop two mobile application projects. These tools have been essential in building robust and feature-rich cross-platform apps.', icon: Icons.code, color: Colors.blue),
                          SkillTooltip(skill: 'PostgreSQL/Supabase', description: 'As the primary database solution in my projects, I have hands-on experience with Supabase, leveraging it for seamless backend integration and database management.', icon: Icons.storage, color: Colors.orange),
                          SkillTooltip(skill: 'Java', description: 'I have foundational knowledge of Java, gained through various school activities and projects, focusing on object-oriented programming and problem-solving.', icon: Icons.computer, color: Colors.redAccent),
                          SkillTooltip(skill: 'Python', description: 'My experience with Python comes primarily from academic tasks, where I utilized it for scripting, data analysis, and completing assignments effectively.', icon: Icons.language, color: Colors.green),
                          SkillTooltip(skill: 'Figma', description: 'I have strong expertise in Figma, which I used extensively to design intuitive and polished layouts for my mobile applications. Creating user-centered designs before development is a process I particularly enjoy and excel at.', icon: Icons.design_services, color: Colors.purple),
                        ],
                      ),
                      SizedBox(height: isWideScreen ? 32 : 24),
                      
                      Text(
                        'Education',
                        style: TextStyle(
                          color: AppTheme.textColor,
                          fontSize: isWideScreen ? 32 : 24, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: isWideScreen ? 24 : 16),
                      _buildEducationItem(
                        'Bachelor of Science in Computer Science',
                        'STI College General Santos City',
                      ),
                      SizedBox(height: 16),
                      _buildEducationItem(
                        'Secondary Education',
                        'Tupi National High School',
                      ),
                      SizedBox(height: isWideScreen ? 32 : 24),
                      
                      Text(
                        'Experience',
                        style: TextStyle(
                          color: AppTheme.textColor,
                          fontSize: isWideScreen ? 32 : 24, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: isWideScreen ? 24 : 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildExperienceItem(
                            'Startup 101 Workshop',
                            'November 2022',
                            'Collaborated with like-minded students to pitch startup solutions emphasizing design thinking and innovation.',
                            'assets/images/startup.jpg', 
                            context, 
                          ),
                          SizedBox(height: 16),
                          _buildExperienceItem(
                            'Unboxing Hackathon: SAR-GEN Startup Challenge',
                            'January 2023',
                            'Developed impactful solutions during a competition to assist General Santos City with real-world challenges.',
                            'assets/images/icebox.jpg', 
                            context, 
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildEducationItem(String title, String school) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppTheme.textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          school,
          style: TextStyle(
            color: AppTheme.textColor.withOpacity(0.8),
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildExperienceItem(
      String title, String date, String description, String imagePath, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            _showImageDialog(imagePath, context); // Show the image dialog
          },
          child: Container(
            width: 150,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppTheme.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  color: AppTheme.textColor.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  color: AppTheme.textColor.withOpacity(0.8),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showImageDialog(String imagePath, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
