import 'package:flutter/material.dart';
import '../styles/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _hoveredIndex = -1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String currentRoute = ModalRoute.of(context)?.settings.name ?? '/';
    List<Map<String, dynamic>> navItems = [
      {'label': 'Home', 'route': '/', 'icon': Icons.home_rounded},
      {'label': 'Projects', 'route': '/projects', 'icon': Icons.code_rounded},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: AppTheme.surfaceColorDark,
          borderRadius: BorderRadius.circular(28.0),
          border: Border.all(color: Colors.white.withOpacity(0.06), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 20.0,
              spreadRadius: 2.0,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            navItems.length,
            (index) => _buildNavButton(
              context,
              navItems[index]['label'],
              navItems[index]['route'],
              navItems[index]['icon'],
              isActive: currentRoute == navItems[index]['route'],
              index: index,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavButton(
    BuildContext context,
    String label,
    String route,
    IconData icon, {
    bool isActive = false,
    required int index,
  }) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredIndex = index),
      onExit: (_) => setState(() => _hoveredIndex = -1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: TextButton(
          onPressed: () {
            if (ModalRoute.of(context)?.settings.name != route) {
              Navigator.pushReplacementNamed(context, route); 
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              isActive ? AppTheme.primaryColorDark.withOpacity(0.2) : Colors.transparent,
            ),
            overlayColor: MaterialStateProperty.all(
              isActive ? AppTheme.primaryColorDark.withOpacity(0.3) : Colors.white.withOpacity(0.05),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            ),
          ),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: isActive || _hoveredIndex == index 
                      ? AppTheme.primaryColorDark 
                      : AppTheme.textColorDark.withOpacity(0.6),
                  size: 18,
                ),
                SizedBox(width: 8),
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    color: isActive || _hoveredIndex == index 
                        ? AppTheme.primaryColorDark 
                        : AppTheme.textColorDark.withOpacity(0.7),
                    fontSize: 14,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                    letterSpacing: 0.2,
                  ),
                ),
                if (isActive)
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColorDark,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
