import 'package:flutter/material.dart';
import 'package:portfolio/styles/theme.dart';

class SkillItem extends StatefulWidget {
  final String skill;
  final String description;
  final Widget image;
  final Color color;
  final bool isWideScreen;

  const SkillItem({
    Key? key,
    required this.skill,
    required this.description,
    required this.image,
    required this.color,
    this.isWideScreen = true,
  }) : super(key: key);

  @override
  State<SkillItem> createState() => _SkillItemState();
}

class _SkillItemState extends State<SkillItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: widget.isWideScreen ? 140 : 110,
        height: widget.isWideScreen ? 140 : 110,
        decoration: BoxDecoration(
          color: AppTheme.cardColorDark,
          borderRadius: BorderRadius.circular(16),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: widget.color.withOpacity(0.5),
                    blurRadius: 12,
                    spreadRadius: 2,
                  )
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    spreadRadius: 0,
                    offset: Offset(0, 2),
                  )
                ],
          border: Border.all(
            color: isHovered ? widget.color : Colors.white.withOpacity(0.1),
            width: 2,
          ),
        ),
        transform: () {
          final matrix = Matrix4.identity();
          if (isHovered) {
            matrix.translate(0, -5);
          }
          return matrix;
        }(),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              _showSkillDetails(context);
            },
            child: Padding(
              padding: EdgeInsets.all(widget.isWideScreen ? 20 : 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: widget.isWideScreen ? 44 : 36,
                    width: widget.isWideScreen ? 44 : 36,
                    child: widget.image,
                  ),
                  SizedBox(height: 14),
                  Text(
                    widget.skill,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: widget.isWideScreen ? 16 : 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSkillDetails(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: isSmallScreen ? size.width * 0.9 : 400,
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppTheme.backgroundColorDark,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: widget.color.withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 5,
                )
              ],
              border: Border.all(
                color: widget.color.withOpacity(0.5),
                width: 2,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppTheme.cardColorDark,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: widget.color.withOpacity(0.3),
                            blurRadius: 8,
                            spreadRadius: 1,
                          )
                        ],
                      ),
                      child: SizedBox(
                        height: 32,
                        width: 32,
                        child: widget.image,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        widget.skill,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.white70),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Divider(color: widget.color.withOpacity(0.2)),
                SizedBox(height: 16),
                Text(
                  widget.description,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 15,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.color.withOpacity(0.2),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: widget.color.withOpacity(0.5),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Text('Close'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
