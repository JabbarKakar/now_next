import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyToolTip extends StatelessWidget {
  final String message;
  const MyToolTip({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        icon: Icon(
          Icons.info_outline_rounded,
          size: 20.sp,
          color: Colors.black,
        ),
        onPressed: () {
          // Handle button press
        },
      ),
    );
  }
}
