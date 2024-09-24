import 'package:design_test/config/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavButton extends StatelessWidget {
  final String label;
  final String svg;
  final VoidCallback onTap;
  final bool isActive;
  const NavButton({
    super.key,
    required this.label,
    required this.svg,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 2,
            width: 24,
            decoration: BoxDecoration(
              color: isActive ? primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 8),
          SvgPicture.asset(
            svg,
            color: isActive ? primaryColor : inactiveColor,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? primaryColor : inactiveColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
