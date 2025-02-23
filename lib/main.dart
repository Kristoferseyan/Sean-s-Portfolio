import 'package:flutter/material.dart';
import 'package:portfolio/pages/contact.dart';
import 'widgets/navigation.dart';
import 'pages/content.dart';
import 'styles/theme.dart';
import 'pages/projects.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sean\'s Portfolio',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: '/', 
      routes: {
        '/': (context) => WebsiteLayout(child: Content()), 
        '/projects': (context) => WebsiteLayout(child: ProjectsPage()),
        '/contact': (context) => WebsiteLayout(child: ContactPage(),), 
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


class WebsiteLayout extends StatelessWidget {
  final Widget child;

  WebsiteLayout({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Column(
        children: [
          Navigation(),
          Expanded(child: child), 
        ],
      ),
    );
  }
}
