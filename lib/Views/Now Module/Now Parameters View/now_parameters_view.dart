import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:now_next/Components/main_button.dart';
import 'package:now_next/Model%20&%20Boxes/Now%20Model/Now%20Parameter%20Model/next_parameter_model.dart';
import 'package:now_next/Model%20&%20Boxes/hive_boxes.dart';
import 'package:now_next/Providers/my_state.dart';
import 'package:provider/provider.dart';

import '../../../App Constants/Constants/constants.dart';
import '../../../Components/custom_elevated_button.dart';
import '../../../Components/my_tool_tip.dart';
import '../Add Now Parameters/add_now_parameters.dart';

class NowParametersView extends StatefulWidget {
  final String? type;
  final String? factorTitle;

  const NowParametersView({Key? key, this.factorTitle, this.type})
      : super(key: key);

  @override
  State<NowParametersView> createState() => _NowParametersViewState();
}

class _NowParametersViewState extends State<NowParametersView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyState>(
      builder: (context, stateProvider, child) {
        return ValueListenableBuilder<Box<NowParameterModel>>(
          valueListenable: HiveBoxes.nowParameterData().listenable(),
          builder: (context, box, _) {
            var data = box.values.toList().cast<NowParameterModel>();

            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.factorTitle.toString(),
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
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: box.length,
                        itemBuilder: (BuildContext context, int index) {
                          return
                            data[index].nowFactorTitle == widget.factorTitle ?
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 3.h),
                              child: Container(
                                  height: 85.h,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      border:
                                      Border.all(color: Colors.grey)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Text(
                                                data[index].nowParameter,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    data[index].nowEmoji,
                                                    textAlign:
                                                    TextAlign.left,
                                                    style: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                        FontWeight
                                                            .w500),
                                                  ),
                                                  Text(
                                                    data[index]
                                                        .nowFaceExpression,
                                                    textAlign:
                                                    TextAlign.left,
                                                    style: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                        FontWeight
                                                            .w500),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          CustomElevatedButton(
                                            color: Colors.red,
                                            title: 'Remove',
                                            onTap: () {
                                              box.deleteAt(index);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            )
                           : const SizedBox.shrink();
                        },
                      ),
                    )
                  ],
                )
                  // : Center(
                  //     child: Text(
                  //       Constants.noParametersFound,
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(
                  //           fontSize: 14.sp,
                  //           fontWeight: FontWeight.w500,
                  //           color: AppColors.primaryColor),
                  //     ),
                  //   )

              ),
              floatingActionButton: MainButton(
                onTap: () {
                  Get.to(() => AddNowParameters(
                    factorTitle: widget.factorTitle.toString(),
                    type: widget.type,
                  ));
                },
                title: 'Add Parameters',
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            );
          },
        );

      },
    );
  }
}
