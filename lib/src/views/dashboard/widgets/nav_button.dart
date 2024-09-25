import 'package:design_test/config/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            height: 2.h,
            width: 24.w,
            decoration: BoxDecoration(
              color: isActive ? primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(height: 8.h),
          SvgPicture.asset(
            svg,
            color: isActive ? primaryColor : inactiveColor,
            height: 24.h,
            width: 24.w,
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Roboto',
              color: isActive ? primaryColor : inactiveColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
