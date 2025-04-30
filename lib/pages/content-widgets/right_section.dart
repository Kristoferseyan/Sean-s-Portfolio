import 'package:flutter/material.dart';
import 'package:portfolio/pages/content-widgets/widgets/skill-item-widget.dart';
import '../../styles/theme.dart';
import '../../widgets/hover_tooltip.dart';

class RightSection extends StatelessWidget {
  final bool isWideScreen;
  final bool isMediumScreen;
  final bool isSmallScreen;

  const RightSection({
    Key? key,
    required this.isWideScreen,
    required this.isMediumScreen,
    required this.isSmallScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.backgroundColorDark,
      padding: EdgeInsets.fromLTRB(
          isSmallScreen ? 24.0 : 48.0, 40.0, 
          isSmallScreen ? 24.0 : 48.0, 60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('About Me', isWideScreen, isMediumScreen),
          SizedBox(height: isWideScreen ? 24 : 16),
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppTheme.cardColorDark,
              borderRadius: BorderRadius.circular(16),
              boxShadow: AppTheme.cardShadow,
            ),
            child: Text(
              'My expertise spans software development, system design, and data analysis, enabling me to craft impactful solutions. '
              'I thrive in collaborative environments where I can apply innovative thinking to drive meaningful results.',
              style: AppTheme.bodyLargeDark.copyWith(
                fontSize: isWideScreen ? 16 : (isMediumScreen ? 15 : 14),
              ),
            ),
          ),
          SizedBox(height: isWideScreen ? 48 : 36),
          _buildSectionHeader('Skills', isWideScreen, isMediumScreen),
          SizedBox(height: isWideScreen ? 24 : 16),
          _buildSkillsSection(isWideScreen, isMediumScreen, isSmallScreen),
          SizedBox(height: isWideScreen ? 48 : 36),
          _buildSectionHeader('Education', isWideScreen, isMediumScreen),
          SizedBox(height: isWideScreen ? 24 : 16),
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppTheme.cardColorDark,
              borderRadius: BorderRadius.circular(16),
              boxShadow: AppTheme.cardShadow,
            ),
            child: Column(
              children: [
                _buildEducationItem(
                  'Bachelor of Science in Computer Science',
                  'STI College General Santos City',
                  '2020 - 2024',
                  isWideScreen,
                  isMediumScreen,
                ),
                SizedBox(height: 24),
                _buildEducationItem(
                  'Secondary Education',
                  'Tupi National High School',
                  '2016 - 2020',
                  isWideScreen,
                  isMediumScreen,
                ),
              ],
            ),
          ),
          SizedBox(height: isWideScreen ? 48 : 36),
          _buildSectionHeader('Experience', isWideScreen, isMediumScreen),
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
                isWideScreen,
                isMediumScreen,
              ),
              SizedBox(height: 24),
              _buildExperienceItem(
                'Unboxing Hackathon: SAR-GEN Startup Challenge',
                'May 2024',
                'Developed impactful solutions during a competition to assist General Santos City with real-world challenges.',
                'assets/images/icebox.jpg',
                context,
                isWideScreen,
                isMediumScreen,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(
      String title, bool isWideScreen, bool isMediumScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: isWideScreen
              ? AppTheme.headingMediumDark
              : (isMediumScreen
                  ? AppTheme.headingMediumDark.copyWith(fontSize: 26)
                  : AppTheme.headingSmallDark),
        ),
        SizedBox(height: 8),
        Container(
          height: 4,
          width: 40,
          decoration: BoxDecoration(
            color: AppTheme.primaryColorDark,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  Widget _buildEducationItem(String title, String school, String period,
      bool isWideScreen, bool isMediumScreen) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 4,
          height: 80,
          decoration: BoxDecoration(
            color: AppTheme.primaryColorDark,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTheme.headingSmallDark.copyWith(
                  fontSize: isWideScreen ? 18 : 16,
                ),
              ),
              SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.school,
                    size: 16,
                    color: AppTheme.primaryColorDark,
                  ),
                  SizedBox(width: 8),
                  Text(
                    school,
                    style: AppTheme.bodyMediumDark.copyWith(
                      fontSize: isWideScreen ? 14 : 13,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 16,
                    color: Colors.grey.shade600,
                  ),
                  SizedBox(width: 8),
                  Text(
                    period,
                    style: AppTheme.bodySmallDark.copyWith(
                      fontSize: isWideScreen ? 14 : 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExperienceItem(
      String title,
      String date,
      String description,
      String imagePath,
      BuildContext context,
      bool isWideScreen,
      bool isMediumScreen) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.cardColorDark,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppTheme.cardShadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                _showImageDialog(imagePath, context);
              },
              child: Hero(
                tag: imagePath,
                child: Container(
                  width: isWideScreen ? 200 : 150,
                  height: isWideScreen ? 150 : 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTheme.headingSmallDark.copyWith(
                        fontSize: isWideScreen ? 18 : 16,
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColorDark.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        date,
                        style: AppTheme.tagTextDark.copyWith(
                          color: AppTheme.primaryColorDark,
                          fontSize: isWideScreen ? 14 : 12,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      description,
                      style: AppTheme.bodyMediumDark.copyWith(
                        fontSize: isWideScreen ? 14 : 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showImageDialog(String imagePath, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(24),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Hero(
              tag: imagePath,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    children: [
                      Image.asset(
                        imagePath,
                        fit: BoxFit.contain,
                      ),
                      Positioned(
                        top: 16,
                        right: 16,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.close, color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSkillsSection(
      bool isWideScreen, bool isMediumScreen, bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 16, left: 4),
          child: Text(
            'Programming Languages',
            style: AppTheme.headingSmallDark.copyWith(
              fontSize: 18,
              color: AppTheme.textColorDark.withOpacity(0.9),
            ),
          ),
        ),
        Wrap(
          spacing: 20.0,
          runSpacing: 20.0,
          children: [
            SkillItem(
              skill: 'Java',
              description:
                  'I have foundational knowledge of Java, gained through various school activities and projects, focusing on object-oriented programming and problem-solving.',
              image: Image.asset('assets/icons/java.png'),
              color: Colors.red.withOpacity(1),
              isWideScreen: isWideScreen,
            ),
            SkillItem(
              skill: 'Python',
              description:
                  'My experience with Python comes primarily from academic tasks, where I utilized it for scripting, data analysis, and completing assignments effectively.',
              image: Image.asset('assets/icons/python.png'),
              color: Colors.green.withOpacity(1),
              isWideScreen: isWideScreen,
            ),
            SkillItem(
              skill: 'Dart',
              description:
                  'I used Dart alongside Flutter for developing the projects that I currently have.',
              image: Image.asset('assets/icons/dart.png'),
              color: Colors.blue.withOpacity(1),
              isWideScreen: isWideScreen,
            ),
            SkillItem(
              skill: 'C#',
              description:
                  'I gained hands-on experience with C# during my on-the-job training, where I was responsible for developing RESTful web APIs and implementing backend services.',
              image: Image.asset('assets/icons/csharp.png'),
              color: Colors.purple.withOpacity(1),
              isWideScreen: isWideScreen,
            ),
            SkillItem(
              skill: 'SQL',
              description:
                  'I\'ve used SQL extensively for database operations, creating complex queries, and managing relational data models for my projects.',
              image: Image.asset('assets/icons/sql.png'),
              color: Colors.orange.shade800.withOpacity(1),
              isWideScreen: isWideScreen,
            ),
          ],
        ),
        SizedBox(height: 32),
        Padding(
          padding: EdgeInsets.only(bottom: 16, left: 4),
          child: Text(
            'Frameworks & Technologies',
            style: AppTheme.headingSmallDark.copyWith(
              fontSize: 18,
              color: AppTheme.textColorDark.withOpacity(0.9),
            ),
          ),
        ),
        Wrap(
          spacing: 20.0,
          runSpacing: 20.0,
          children: [
            SkillItem(
              skill: 'Flutter',
              description:
                  'I have extensive experience using Flutter which I relied on heavily to develop my projects.',
              image: Image.asset('assets/icons/flutter.png'),
              color: Colors.blue.withOpacity(1),
              isWideScreen: isWideScreen,
            ),
            SkillItem(
              skill: 'ASP.NET',
              description:
                  'I worked with ASP.NET during my on-the-job training, developing RESTful web APIs and implementing backend services.',
              image: Image.asset('assets/icons/asp.png'),
              color: Colors.blue.shade700.withOpacity(1),
              isWideScreen: isWideScreen,
            ),
            SkillItem(
              skill: 'PostgreSQL',
              description:
                  'Experienced in designing and optimizing PostgreSQL databases, with a focus on performance and data integrity.',
              image: Image.asset('assets/icons/postgre.png'),
              color: Colors.blue.shade800.withOpacity(1),
              isWideScreen: isWideScreen,
            ),
            SkillItem(
              skill: 'Supabase',
              description:
                  'As the primary database solution in my projects, I have hands-on experience with Supabase, leveraging it for seamless backend integration and database management.',
              image: Image.asset('assets/icons/Supabase.png'),
              color: Colors.green.withOpacity(1),
              isWideScreen: isWideScreen,
            ),
            SkillItem(
              skill: 'Docker',
              description:
                  'I used Docker to containerize and run SQL databases on my Mac, creating consistent development environments for my projects.',
              image: Image.asset('assets/icons/docker.png'),
              color: Colors.blue.shade600.withOpacity(1),
              isWideScreen: isWideScreen,
            ),
          ],
        ),
        SizedBox(height: 32),
        Padding(
          padding: EdgeInsets.only(bottom: 16, left: 4),
          child: Text(
            'Web Technologies',
            style: AppTheme.headingSmallDark.copyWith(
              fontSize: 18,
              color: AppTheme.textColorDark.withOpacity(0.9),
            ),
          ),
        ),
        Wrap(
          spacing: 20.0,
          runSpacing: 20.0,
          children: [
            SkillItem(
              skill: 'HTML',
              description:
                  'I have foundational skills on HTML through The Odin Project course, where I learned to create semantic and accessible web pages.',
              image: Image.asset('assets/icons/html.png'),
              color: Colors.orange.withOpacity(1),
              isWideScreen: isWideScreen,
            ),
            SkillItem(
              skill: 'CSS',
              description:
                  'I developed my foundational skills in CSS through The Odin Project course, learning how to style web pages with responsive layouts and modern design principles.',
              image: Image.asset('assets/icons/css.png'),
              color: Colors.blue.withOpacity(1),
              isWideScreen: isWideScreen,
            ),
          ],
        ),
        SizedBox(height: 32),
        Padding(
          padding: EdgeInsets.only(bottom: 16, left: 4),
          child: Text(
            'Design & Development Tools',
            style: AppTheme.headingSmallDark.copyWith(
              fontSize: 18,
              color: AppTheme.textColorDark.withOpacity(0.9),
            ),
          ),
        ),
        Wrap(
          spacing: 20.0,
          runSpacing: 20.0,
          children: [
            SkillItem(
              skill: 'Figma',
              description:
                  'I have strong expertise in Figma, which I used extensively to design intuitive and polished layouts for my mobile applications. Creating user-centered designs before development is a process I particularly enjoy and excel at.',
              image: Image.asset('assets/icons/figma.png'),
              color: Colors.purple.withOpacity(1),
              isWideScreen: isWideScreen,
            ),
            SkillItem(
              skill: 'Azure Data Studio',
              description:
                  'I utilized Azure Data Studio as my primary database tool while learning and developing web APIs. It was essential for database administration, query testing, and managing SQL Server connections throughout my API development process.',
              image: Image.asset('assets/icons/azure.png'),
              color: Colors.blue.shade700.withOpacity(1),
              isWideScreen: isWideScreen,
            ),
            SkillItem(
              skill: 'Git',
              description:
                  'Experienced with Git for version control, including branching strategies, pull requests, and collaborative development workflows.',
              image: Image.asset('assets/icons/git.png'),
              color: Colors.orange.shade700.withOpacity(1),
              isWideScreen: isWideScreen,
            ),
            SkillItem(
              skill: 'VS Code',
              description:
                  'Proficient with Visual Studio Code as my primary development environment, utilizing extensions and customizations for improved productivity.',
              image: Image.asset('assets/icons/vscode.png'),
              color: Colors.blue.shade500.withOpacity(1),
              isWideScreen: isWideScreen,
            ),
          ],
        ),
      ],
    );
  }
}
