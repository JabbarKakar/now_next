import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../App Constants/App Colors/app_colors.dart';

class YellowButton extends StatelessWidget {
  final double height, width;
  final String title;
  final void Function() onTap;
  const YellowButton({
    super.key,
    required this.height,
    required this.width,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            color: AppColors.yellowButton),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
