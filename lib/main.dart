import 'package:flutter/material.dart';
import 'package:portfolio/pages/contact.dart';
import 'widgets/navigation.dart';
import 'pages/content.dart';
import 'styles/theme.dart';
import 'pages/projects.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sean\'s Portfolio',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: '/', 
      routes: {
        '/': (context) => const WebsiteLayout(child: Content()), 
        '/projects': (context) => const WebsiteLayout(child: ProjectsPage()),
        '/contact': (context) => const WebsiteLayout(child: ContactPage(),), 
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


class WebsiteLayout extends StatelessWidget {
  final Widget child;

  const WebsiteLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Column(
        children: [
          const Navigation(),
          Expanded(child: child), 
        ],
      ),
    );
  }
}
