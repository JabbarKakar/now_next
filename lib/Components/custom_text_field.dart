import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../App Constants/App Colors/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final double height, width;
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator? onValidator;
  final Function(String)? onChanged;
  const CustomTextField({
    super.key,
    required this.height,
    required this.width,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.onValidator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.primaryColor, width: .5),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          validator: onValidator,
          keyboardType: TextInputType.text,
          maxLines: 8,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
