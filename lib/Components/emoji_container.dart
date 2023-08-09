
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../App Constants/App Colors/app_colors.dart';

class EmojiContainer extends StatelessWidget {
  final String emoji, title;
  final Color textColor;
  final Color borderColor;
  final void Function() onTap;
  const EmojiContainer({
    super.key, required this.emoji, required this.title, required this.textColor, required this.onTap, required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80.h,
        width: 90.w,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: borderColor, width: 4),
          borderRadius: BorderRadius.circular(10.sp),
          boxShadow:
          [
            BoxShadow(
              color: AppColors.primaryColor,
              blurRadius: 3,
              spreadRadius: 2.0,
              offset: const Offset(0, 3), // horizontal, vertical offset
            ),
          ],

        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                emoji,
                style: TextStyle(
                  fontSize: 24.sp,
                ),
              ),
              // SizedBox(height: 5.h,),
              Text(title,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: textColor
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}