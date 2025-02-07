import 'package:flutter/material.dart';
import 'package:yantra_blackspace/constants.dart';

Widget buildBottomNav(BuildContext context) {
  return Container(
    margin: EdgeInsets.all(16),
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
    decoration: BoxDecoration(
      color: primaryOrange, // Dark background color
      borderRadius: BorderRadius.circular(32),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 10,
          offset: Offset(0, -4),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Home Icon
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              child: Icon(Icons.home, color: Colors.white, size: 28),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ), // Green icon
            SizedBox(height: 4),
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.white, // Green dot
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
        // Stats Icon
        GestureDetector(
          child: Icon(Icons.bar_chart_rounded, color: Colors.white54, size: 28),
          onTap: () => Navigator.pushNamed(context, '/data'),
        ), // Gray icon

        // Settings Icon
        GestureDetector(
          child: Icon(Icons.settings, color: Colors.white54, size: 28),
          onTap: () => Navigator.pushNamed(context, '/profile'),
        ), // Gray icon
      ],
    ),
  );
}
