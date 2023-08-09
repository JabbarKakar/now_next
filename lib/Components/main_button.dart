import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../App Constants/App Colors/app_colors.dart';

class MainButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  const MainButton({Key? key, required this.onTap, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 150.w,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text(title,
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
