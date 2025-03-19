// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../styles/theme.dart';
import '../widgets/hover_tooltip.dart';
import 'package:google_fonts/google_fonts.dart';

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

        return Scaffold(
          backgroundColor: AppTheme.backgroundColorDark,
          body: isWideScreen
              ? Row(
                  children: [
                    SizedBox(
                      width: isWideScreen ? 400 : (isMediumScreen ? 300 : 200),
                      height: double.infinity,
                      child: _buildLeftSection(
                          context, isWideScreen, isMediumScreen, isSmallScreen),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: AppTheme.subtleGradient,
                        ),
                        child: SingleChildScrollView(
                          padding: EdgeInsets.zero,
                          physics: BouncingScrollPhysics(),
                          child: _buildRightSection(context, isWideScreen,
                              isMediumScreen, isSmallScreen),
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 530,
                      child: _buildLeftSection(
                          context, isWideScreen, isMediumScreen, isSmallScreen),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: AppTheme.subtleGradient,
                        ),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: _buildRightSection(context, isWideScreen,
                              isMediumScreen, isSmallScreen),
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildLeftSection(BuildContext context, bool isWideScreen,
      bool isMediumScreen, bool isSmallScreen) {
    return Container(
      padding:
          EdgeInsets.fromLTRB(isSmallScreen ? 20.0 : 40.0, 60.0, 20.0, 40.0),
      decoration: BoxDecoration(
        color: AppTheme.backgroundColorDark,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: AppTheme.cardShadow,
                ),
                child: CircleAvatar(
                  radius: isWideScreen ? 85 : (isSmallScreen ? 90 : 90),
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: isWideScreen ? 80 : (isSmallScreen ? 85 : 85),
                    backgroundImage: AssetImage('assets/pfp.png'),
                  ),
                ),
              ),
            ),
            SizedBox(height: isWideScreen ? 32 : 24),
            Center(
              child: Text(
                'Sean Nuevo',
                style: isWideScreen
                    ? AppTheme.headingLargeDark.copyWith(color: Colors.white)
                    : AppTheme.headingMediumDark.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(height: 4),
            Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: isWideScreen ? 200 : (isMediumScreen ? 180 : 160),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Text(
                  'Full Stack Developer',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: isWideScreen ? 16 : (isMediumScreen ? 14 : 12),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: isWideScreen ? 24 : 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_pin,
                  color: Colors.white.withOpacity(0.8),
                  size: isWideScreen ? 22 : (isMediumScreen ? 18 : 16),
                ),
                SizedBox(width: 8),
                Text(
                  'South Cotabato, Philippines',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: isWideScreen ? 16 : (isMediumScreen ? 14 : 12),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialButton(
                  'assets/images/fb.png',
                  'https://www.facebook.com/sean.nuevo.52',
                  isWideScreen,
                  isMediumScreen,
                ),
                SizedBox(width: 16),
                _buildSocialButton(
                  'assets/images/github.png',
                  'https://github.com/Kristoferseyan',
                  isWideScreen,
                  isMediumScreen,
                ),
              ],
            ),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      final url = Uri.parse('https://nuevo-resume.tiiny.site');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url,
                            mode: LaunchMode.externalApplication);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Could not download the resume.')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(isWideScreen ? 300 : 200, 0),
                      backgroundColor: AppTheme.cardColorDark,
                      foregroundColor: AppTheme.primaryColorDark,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(
                        vertical: isWideScreen ? 16 : 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: Icon(Icons.file_download_outlined, size: 18),
                    label: Text(
                      'Download Resume',
                      style: AppTheme.buttonText.copyWith(
                        color: AppTheme.primaryColorDark,
                        fontSize: isWideScreen ? 16 : 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(
      String iconPath, String url, bool isWideScreen, bool isMediumScreen) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppTheme.surfaceColorDark,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Image.asset(
          iconPath,
          height: isWideScreen ? 24 : (isMediumScreen ? 20 : 18),
          width: isWideScreen ? 24 : (isMediumScreen ? 20 : 18),
        ),
      ),
    );
  }

  Widget _buildRightSection(BuildContext context, bool isWideScreen,
      bool isMediumScreen, bool isSmallScreen) {
    return Container(
      color: AppTheme.backgroundColorDark,
      padding: EdgeInsets.fromLTRB(
          isSmallScreen ? 24.0 : 48.0, 40.0, isSmallScreen ? 24.0 : 0.0, 60.0),
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
              'Im a graduating Computer Science student with a passion for solving real-world problems. '
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

  Widget _buildSkillsSection(bool isWideScreen, bool isMediumScreen, bool isSmallScreen) {
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
          spacing: 16.0,
          runSpacing: 16.0,
          children: [
            SkillTooltip(
              skill: 'Java',
              description: 'I have foundational knowledge of Java, gained through various school activities and projects,\n'
                  'focusing on object-oriented programming and problem-solving.',
              image: Image.asset('assets/icons/java.png'),
              color: Colors.red.withOpacity(1),  // Fixed opacity issue
            ),
            SkillTooltip(
              skill: 'Python',
              description: 'My experience with Python comes primarily from academic tasks, '
                  '\nwhere I utilized it for scripting, data analysis, and completing assignments effectively.',
              image: Image.asset('assets/icons/python.png'),
              color: Colors.green.withOpacity(1),
            ),
            SkillTooltip(
              skill: 'Dart',
              description: 'I used Dart alongside Flutter for developing the projects that I currenlty have.',
              image: Image.asset('assets/icons/dart.png'),
              color: Colors.blue.withOpacity(1),
            ),
            SkillTooltip(
              skill: 'C#',
              description: 'I gained hands-on experience with C# during my on-the-job training, where I was \nresponsible for developing RESTful web APIs and implementing backend services.',
              image: Image.asset('assets/icons/csharp.png'),
              color: Colors.purple.withOpacity(1),
            ),
            SkillTooltip(
              skill: 'SQL',
              description: 'I\'ve used SQL extensively for database operations, creating complex \nqueries, and managing relational data models for my projects.',
              image: Image.asset('assets/icons/sql.png'),
              color: Colors.orange.shade800.withOpacity(1),
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
          spacing: 16.0,
          runSpacing: 16.0,
          children: [
            SkillTooltip(
              skill: 'Flutter',
              description: 'I have extensive experience using Flutter which I relied on '
                  'heavily to develop my projects,',
              image: Image.asset('assets/icons/flutter.png'),
              color: Colors.blue.withOpacity(1),
            ),
            SkillTooltip(
              skill: 'ASP.NET',
              description: 'I worked with ASP.NET during my on-the-job training, '
                  '\ndeveloping RESTful web APIs and implementing backend services.',
              image: Image.asset('assets/icons/asp.png'),
              color: Colors.blue.shade700.withOpacity(1),
            ),
            SkillTooltip(
              skill: 'PostgreSQL',
              description: 'Experienced in designing and optimizing PostgreSQL \ndatabases, '
                  'with a focus on performance and data integrity.',
              image: Image.asset('assets/icons/postgre.png'),
              color: Colors.blue.shade800.withOpacity(1),
            ),
            SkillTooltip(
              skill: 'Supabase',
              description: 'As the primary database solution in my projects, I have hands-on experience with \nSupabase, '
                  'leveraging it for seamless backend integration and database management.',
              image: Image.asset('assets/icons/Supabase.png'),
              color: Colors.green.withOpacity(1),
            ),
            SkillTooltip(
              skill: 'Docker',
              description: 'I used Docker to containerize and run SQL databases on my Mac, \ncreating consistent development environments for my projects.',
              image: Image.asset('assets/icons/docker.png'),
              color: Colors.blue.shade600.withOpacity(1),
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
          spacing: 16.0,
          runSpacing: 16.0,
          children: [
            SkillTooltip(
              skill: 'HTML',
              description: 'I have foundational skills on HTML through The Odin Project course, '
                  '\nwhere I learned to create semantic and accessible web pages.',
              image: Image.asset('assets/icons/html.png'),
              color: Colors.orange.withOpacity(1),
            ),
            SkillTooltip(
              skill: 'CSS',
                description: 'I developed my foundational skills in CSS through The Odin Project course,\nlearning how to style web pages with responsive layouts and modern design principles.',
              image: Image.asset('assets/icons/css.png'),
              color: Colors.blue.withOpacity(1),
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
          spacing: 16.0,
          runSpacing: 16.0,
          children: [
            SkillTooltip(
              skill: 'Figma',
              description: 'I have strong expertise in Figma, which I used extensively to design intuitive and '
                  '\npolished layouts for my mobile applications. Creating user-centered designs '
                  '\nbefore development is a process I particularly enjoy and excel at.',
              image: Image.asset('assets/icons/figma.png'),
              color: Colors.purple.withOpacity(1),
            ),
            SkillTooltip(
              skill: 'Azure Data Studio',
                description: 'I utilized Azure Data Studio as my primary database tool while learning and developing web APIs. '
                  '\nIt was essential for database administration, query testing, and managing SQL Server \nconnections throughout my API development process.',
              image: Image.asset('assets/icons/azure.png'),
              color: Colors.blue.shade700.withOpacity(1),
            ),
            SkillTooltip(
              skill: 'Git',
              description: 'Experienced with Git for version control, including branching strategies, '
                  '\npull requests, and collaborative development workflows.',
              image: Image.asset('assets/icons/git.png'),
              color: Colors.orange.shade700.withOpacity(1),
            ),
            SkillTooltip(
              skill: 'VS Code',
              description: 'Proficient with Visual Studio Code as my primary development environment, '
                  '\nutilizing extensions and customizations for improved productivity.',
              image: Image.asset('assets/icons/vscode.png'),
              color: Colors.blue.shade500.withOpacity(1),
            ),
          ],
        ),
      ],
    );
  }
}
