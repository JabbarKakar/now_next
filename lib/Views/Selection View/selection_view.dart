import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:now_next/App%20Constants/App%20Images/app_images.dart';
import 'package:now_next/Components/custom_selection_container.dart';
import 'package:now_next/Model%20&%20Boxes/Next%20Model/Next%20Factor%20Model/next_factor_model.dart';

import '../Next Module/Next Categories View/next_categories_view.dart';
import '../Now Module/Now Catagories View/now_catagories_view.dart';

class SelectionView extends StatelessWidget {
  const SelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Box<NextFactorModel> nextFactorBox = Hive.box<NextFactorModel>('NextFactorBox');
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          size: 20.sp,
        ),
        actions: [
          Icon(
            Icons.notifications_none_outlined,
            size: 20.sp,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          children: [
            CustomSelectionContainer(
              onTap: () {
                Get.to(() => const NowCategories(now: 'Now Categories'));
              },
              image: AppImages.blueBgPng,
              title: 'Now',
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomSelectionContainer(
              onTap: () {
                Get.to(() => const NextCategoriesView(next: 'Next Categories'));
              },
              image: AppImages.yellowBgPng,
              title: 'Next',
            ),
          ],
        ),
      ),
    );
  }
}
