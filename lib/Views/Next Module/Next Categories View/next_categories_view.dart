import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:now_next/Providers/my_state.dart';

import '../../../App Constants/Constants/constants.dart';
import '../Next List View/next_list_view.dart';

class NextCategoriesView extends StatefulWidget {
  final String next;
  const NextCategoriesView({Key? key, required this.next}) : super(key: key);

  @override
  State<NextCategoriesView> createState() => _NextCategoriesViewState();
}

class _NextCategoriesViewState extends State<NextCategoriesView> {
  MyState myState = MyState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.next,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
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
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            Expanded(
              child: MasonryGridView.builder(
                  gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: Constants.nowDataList.length,
                  itemBuilder: (context, index) {
                    final items = Constants.nowDataList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          final String type = items['title'];
                          //Get.to(() =>  ShowAllNowFactorView(type: type));
                          Get.to(() =>  NextListView(listTitle: items['title']!));
                        },
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(10.sp),
                                    child: Image.asset(items['img']!)),
                                Positioned(
                                    top: items['top'],
                                    left: 8.w,
                                    child: Container(
                                        height: 25.h,
                                        width: items['width'],
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(10.sp)),
                                        child: Center(
                                          child: Text(
                                            items['title']!,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        )))
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
