import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../App Constants/App Images/app_images.dart';

class CustomSelectionContainer extends StatelessWidget {
  final String image;
  final String title;
  final void Function() onTap;
  const CustomSelectionContainer(
      {Key? key, required this.image, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 280.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 130.h,
                width: 130.w,
                child: Image.asset(AppImages.treePng)),
            Text(
              title,
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                letterSpacing: 3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
