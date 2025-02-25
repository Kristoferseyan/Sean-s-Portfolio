import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = screenWidth <= 600;
    bool isMediumScreen = screenWidth > 600 && screenWidth <= 1000;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 16.0 : (isMediumScreen ? 100.0 : 200.0),
        vertical: 40.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isSmallScreen)
            Column(
              children: [
                FadeInLeft(
                  child: _buildContactCard(
                    icon: Icons.email,
                    title: 'Email',
                    value: 'christophersean08@gmail.com',
                    onTap: () async {
                      final emailUri = Uri(
                        scheme: 'mailto',
                        path: 'christophersean08@gmail.com',
                      );
                      if (await canLaunch(emailUri.toString())) {
                        await launch(emailUri.toString());
                      }
                    },
                  ),
                ),
                const SizedBox(height: 16),
                FadeInUp(
                  child: _buildContactCard(
                    icon: Icons.phone,
                    title: 'Phone',
                    value: '+63 948 581 2000',
                    onTap: () async {
                      final phoneUri = Uri(
                        scheme: 'tel',
                        path: '+639485812000',
                      );
                      if (await canLaunch(phoneUri.toString())) {
                        await launch(phoneUri.toString());
                      }
                    },
                  ),
                ),
                const SizedBox(height: 16),
                FadeInRight(
                  child: _buildContactCard(
                    icon: Icons.facebook,
                    title: 'Facebook',
                    value: 'facebook.com/sean.nuevo.52',
                    onTap: () async {
                      final url = Uri.parse('https://facebook.com/sean.nuevo.52');
                      if (await canLaunch(url.toString())) {
                        await launch(url.toString());
                      }
                    },
                  ),
                ),
              ],
            ),
          if (!isSmallScreen)

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: FadeInLeft(
                    child: _buildContactCard(
                      icon: Icons.email,
                      title: 'Email',
                      value: 'christophersean08@gmail.com',
                      onTap: () async {
                        final emailUri = Uri(
                          scheme: 'mailto',
                          path: 'christophersean08@gmail.com',
                        );
                        if (await canLaunch(emailUri.toString())) {
                          await launch(emailUri.toString());
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(width: isMediumScreen ? 16 : 32),
                Expanded(
                  child: FadeInUp(
                    child: _buildContactCard(
                      icon: Icons.phone,
                      title: 'Phone',
                      value: '+63 948 581 2000',
                      onTap: () async {
                        final phoneUri = Uri(
                          scheme: 'tel',
                          path: '+639485812000',
                        );
                        if (await canLaunch(phoneUri.toString())) {
                          await launch(phoneUri.toString());
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(width: isMediumScreen ? 16 : 32),
                Expanded(
                  child: FadeInRight(
                    child: _buildContactCard(
                      icon: Icons.facebook,
                      title: 'Facebook',
                      value: 'facebook.com/sean.nuevo.52',
                      onTap: () async {
                        final url = Uri.parse('https://facebook.com/sean.nuevo.52');
                        if (await canLaunch(url.toString())) {
                          await launch(url.toString());
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.blue,
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}