


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color color;
  final String title;
  final void Function() onTap;
  const CustomElevatedButton({
    super.key, required this.color, required this.title, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30.h,
        width: 70.w,
        decoration: BoxDecoration(
            color: color,
            borderRadius:
            BorderRadius.circular(10)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}