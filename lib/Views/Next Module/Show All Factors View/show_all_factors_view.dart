import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:now_next/App%20Constants/App%20Colors/app_colors.dart';
import 'package:now_next/App%20Constants/App%20Images/app_images.dart';
import 'package:now_next/Components/main_button.dart';
import 'package:now_next/Model%20&%20Boxes/hive_boxes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:now_next/Providers/my_state.dart';
import 'package:provider/provider.dart';

import '../../../App Constants/Constants/constants.dart';
import '../../../Components/custom_elevated_button.dart';
import '../../../Components/my_tool_tip.dart';
import '../../../Model & Boxes/Next Model/Next Factor Model/next_factor_model.dart';
import '../Add new Factor View/add_new_factoe_view.dart';
import '../Parameters View/parameters_view.dart';
import '../Templates/use_template_or_create_own.dart';

class ShowAllFactorView extends StatefulWidget {
  final String? type;
  const ShowAllFactorView({
    required this.type,
    Key? key,
  }) : super(key: key);
  @override
  State<ShowAllFactorView> createState() => _ShowAllFactorViewState();
}

class _ShowAllFactorViewState extends State<ShowAllFactorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Show All Factor',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            MyToolTip(message: Constants.toolTip),
          ],
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
      body: Consumer<MyState>(builder: (context, stateProvider, child) {
        return ValueListenableBuilder<Box<NextFactorModel>>(
          valueListenable: HiveBoxes.nextFactorData().listenable(),
          builder: (context, box, _) {
            var data = box.values.toList().cast<NextFactorModel>();
            stateProvider.openNextFactorHiveBox(type: widget.type.toString());
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: Column(
                children: [
                  stateProvider.nextFactorAlreadyExist
                      ? Column(
                          children: [
                            Center(
                              child: SizedBox(
                                  height: 112.h,
                                  width: 112.w,
                                  child: Image.asset(AppImages.dummy)),
                            ),
                            SizedBox(
                              height: 50.h,
                            ),
                            Center(
                              child: Text(
                                Constants.noFactorFound,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(.72),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              height: 90.h,
                            ),
                            Text(
                              'Add first factor',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primaryColor),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            SvgPicture.asset(
                              AppImages.arrow,
                              height: 40.h,
                            )
                          ],
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: box.length,
                            itemBuilder: (BuildContext context, int index) {
                              return data[index].type == widget.type
                                  ? Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 3.h),
                                      child: Container(
                                          height: 80.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.grey)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: 240.w,
                                                  child: Text(
                                                    data[index].factor,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    CustomElevatedButton(
                                                      color: Colors.red,
                                                      title: 'Remove',
                                                      onTap: () {
                                                        // stateProvider.openHiveBox(type: widget.type.toString());
                                                        box.deleteAt(index);
                                                      },
                                                    ),
                                                    CustomElevatedButton(
                                                      color: AppColors
                                                          .primaryColor,
                                                      title: 'Parameters',
                                                      onTap: () {
                                                        Get.to(() => //UseTemplateOrCreateOwn(factorTitle: data[index].factor)
                                                            ParametersView(
                                                                factorTitle: data[index].factor)
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          )),
                                    )
                                  : const SizedBox.shrink();
                            },
                          ),
                        ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            );
          },
        );
      }),
      floatingActionButton: MainButton(
        title: 'Add Factor',
        onTap: () {
          Get.to(() => AddNewFactorView(
                type: widget.type,
              ));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
