import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(200.0,40.0,200.0,40.0,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              SizedBox(width: 32),
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
              SizedBox(width: 32),
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
          SizedBox(height: 40),
          FadeInUp(
            child: _buildContactForm(context),
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
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.blue,
              ),
              SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
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

  Widget _buildContactForm(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _messageController = TextEditingController();

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Form',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            _buildStylizedTextField(
              hintText: 'Your Name',
              controller: _nameController,
              icon: Icons.person,
            ),
            SizedBox(height: 16),
            _buildStylizedTextField(
              hintText: 'Your Email',
              controller: _emailController,
              icon: Icons.email,
            ),
            SizedBox(height: 16),
            _buildStylizedTextField(
              hintText: 'Your Message',
              controller: _messageController,
              icon: Icons.message,
              maxLines: 5,
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final emailUri = Uri(
                    scheme: 'mailto',
                    path: 'sean.nuevo@example.com',
                    queryParameters: {
                      'subject': 'Message from ${_nameController.text}',
                      'body': 'Name: ${_nameController.text}\n'
                          'Email: ${_emailController.text}\n\n'
                          '${_messageController.text}',
                    },
                  );
                  if (await canLaunch(emailUri.toString())) {
                    await launch(emailUri.toString());
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  shadowColor: Colors.blueAccent,
                ),
                child: Text(
                  'Send Message',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStylizedTextField({
    required String hintText,
    required TextEditingController controller,
    required IconData icon,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.blue),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
