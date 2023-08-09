import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:now_next/App%20Constants/App%20Images/app_images.dart';

class Container2 extends StatelessWidget {
  const Container2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 217.h,
                width: 217.w,
                child: Image.asset(AppImages.boardingImg2)),
            SizedBox(
              height: 85.h,
            ),
            Text(
              'Choose from a variety of professions',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
