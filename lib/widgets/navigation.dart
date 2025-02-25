import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    String currentRoute = ModalRoute.of(context)?.settings.name ?? '/';

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: const Color(0xFF1F2633),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 6.0,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildNavButton(
              context,
              'Home',
              '/', 
              isActive: currentRoute == '/', 
            ),
            _buildNavButton(
              context,
              'Projects',
              '/projects', 
              isActive: currentRoute == '/projects', 
            ),
            _buildNavButton(
              context,
              'Contact',
              '/contact', 
              isActive: currentRoute == '/contact',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(
    BuildContext context,
    String label,
    String route, {
    bool isActive = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: () {
          if (ModalRoute.of(context)?.settings.name != route) {
            Navigator.pushReplacementNamed(context, route); 
          }
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            isActive ? const Color(0xFF417492) : Colors.transparent,
          ),
          overlayColor: WidgetStateProperty.all(
            isActive ? const Color(0xFF345A6D).withOpacity(0.3) : Colors.white.withOpacity(0.1),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : const Color(0xFF9AA5B1),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
