import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../App Constants/App Colors/app_colors.dart';

class CustomContainer extends StatelessWidget {
  final String image;
  final String svgImage;
  final String title;
  final Function() onTap;
  const CustomContainer({
    super.key, required this.image, required this.svgImage, required this.title, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Container(
          height: 190.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                child: SizedBox(
                  height: 140.h,
                  width: double.infinity,
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          SizedBox(
                              height: 22.h,
                              width: 22.h,
                              child:
                              SvgPicture.asset(svgImage)),
                          SizedBox(
                            width: 25.w,
                          ),
                          Text(title,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: AppColors.primaryColor,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}