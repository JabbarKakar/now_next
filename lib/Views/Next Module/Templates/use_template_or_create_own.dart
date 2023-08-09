import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:now_next/App%20Constants/App%20Colors/app_colors.dart';
import 'package:now_next/App%20Constants/App%20Images/app_images.dart';

import '../../../Model & Boxes/Next Model/Next Factor Model/next_factor_model.dart';
import '../../../Model & Boxes/hive_boxes.dart';
import '../Add Parameters/add_parameters.dart';
import '../Parameters View/parameters_view.dart';

class UseTemplateOrCreateOwn extends StatefulWidget {
  final String factorTitle;
  const UseTemplateOrCreateOwn({Key? key, required this.factorTitle}) : super(key: key);

  @override
  State<UseTemplateOrCreateOwn> createState() => _UseTemplateOrCreateOwnState();
}

class _UseTemplateOrCreateOwnState extends State<UseTemplateOrCreateOwn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select one'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        child: ValueListenableBuilder<Box<NextFactorModel>>(
          valueListenable: HiveBoxes.nextFactorData().listenable(),
          builder: (context, box, _) {
            var data = box.values.toList().cast<NextFactorModel>();
            return Column(
              children: [
                Text(widget.factorTitle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.to(() =>
                              AddParameters(
                            factorTitle: widget.factorTitle.toString(),
                           temp: 'temp'
                           // type: widget.type,
                          )
                        );
                      },
                      child: Container(
                        width: 160,
                        height: 161.43,
                        decoration: ShapeDecoration(
                          color: AppColors.yellowButton,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x4C95ADFE),
                              blurRadius: 22,
                              offset: Offset(0, 10),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppImages.template),
                            SizedBox(height: 10.h,),
                            Text(
                              'Use Template',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(
                            AddParameters(
                                factorTitle: widget.factorTitle.toString(),
                                temp: ''
                              // type: widget.type,
                            )

                        );
                      },
                      child: Container(
                        width: 160,
                        height: 161.43,
                        decoration: ShapeDecoration(
                          color: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x4C95ADFE),
                              blurRadius: 22,
                              offset: Offset(0, 10),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.add_circle_outline, color: AppColors.white, size: 45.sp,),
                            SizedBox(height: 10.h,),
                            Text(
                              'Create Own',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
