import 'package:flutter/material.dart';
import 'widgets/navigation.dart';
import 'widgets/content.dart';
import 'widgets/footer.dart';
import 'styles/theme.dart';
import 'widgets/projects.dart';
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
          Footer(),
        ],
      ),
    );
  }
}
