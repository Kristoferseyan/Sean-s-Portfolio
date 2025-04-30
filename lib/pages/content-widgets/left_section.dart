import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../styles/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LeftSection extends StatelessWidget {
  final bool isWideScreen;
  final bool isMediumScreen;
  final bool isSmallScreen;

  const LeftSection({
    Key? key,
    required this.isWideScreen,
    required this.isMediumScreen,
    required this.isSmallScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          isSmallScreen ? 20.0 : 24.0, 
          10.0,
          isSmallScreen ? 20.0 : 24.0, 
          40.0),
      decoration: BoxDecoration(
        color: AppTheme.backgroundColorDark,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(125, 255, 255, 255).withOpacity(0.2),
                blurRadius: 15,
                spreadRadius: 0.5,
                offset: Offset(0, 4),
              ),
            ],
                ),
                child: CircleAvatar(
            radius: isWideScreen ? 140 : (isSmallScreen ? 85 : 90),
            backgroundColor: Colors.white.withOpacity(0.05),
            child: CircleAvatar(
              radius: isWideScreen ? 135 : (isSmallScreen ? 80 : 85),
              backgroundImage: AssetImage('assets/pfp.png'),
            ),
                ),
              ),
            ),
            SizedBox(height: isWideScreen ? 8 : 24),
            Text(
              'Sean Nuevo',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: isWideScreen ? 30 : 36,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 12),
            Container(
              constraints: BoxConstraints(
                maxWidth: isWideScreen ? 240 : (isMediumScreen ? 220 : 200),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xFF1E293B).withOpacity(0.7),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
            color: Colors.white.withOpacity(0.1),
            width: 1,
                ),
              ),
              child: Text(
                'Software Developer',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: isWideScreen ? 14 : (isMediumScreen ? 16 : 14),
            fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                'Building innovative solutions for real-world challenges.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
            color: Colors.white.withOpacity(0.8),
            fontSize: isWideScreen ? 14 : 13,
            height: 1.4,
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
            Icons.location_on_outlined,
            color: Colors.white.withOpacity(0.8),
            size: 18,
                ),
                SizedBox(width: 6),
                Text(
            'South Cotabato, Philippines',
            style: GoogleFonts.poppins(
              color: Colors.white.withOpacity(0.8),
              fontSize: 14,
            ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialButton(
            icon: FontAwesomeIcons.facebook,
            url: 'https://www.facebook.com/sean.nuevo.52',
                ),
                SizedBox(width: 12),
                _buildSocialButton(
            icon: FontAwesomeIcons.github,
            url: 'https://github.com/Kristoferseyan',
                ),
              ],
            ),
            SizedBox(height: 8),
            SizedBox(
              width: isWideScreen ? 240 : 200,
              height: isWideScreen ? 48 : 44,
              child: ElevatedButton.icon(
                onPressed: () async {
            final url = Uri.parse('https://nuevo-resume.tiiny.site');
            if (await canLaunchUrl(url)) {
              await launchUrl(url, mode: LaunchMode.externalApplication);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Could not download the resume.')),
              );
            }
                },
                style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF1E293B),
            foregroundColor: Colors.white,
            elevation: 0,
            padding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.white.withOpacity(0.1),
                width: 1,
              ),
            ),
                ),
                icon: Icon(Icons.download_outlined, size: 18),
                label: Text(
            'Download Resume',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String url,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
        borderRadius: BorderRadius.circular(50),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color(0xFF1E293B),
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: FaIcon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
