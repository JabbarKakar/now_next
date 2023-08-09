import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:now_next/App%20Constants/App%20Colors/app_colors.dart';
import 'package:now_next/Components/yellow_button.dart';
import 'package:provider/provider.dart';

import '../../../App Constants/Constants/constants.dart';
import '../../../Components/emoji_container.dart';
import '../../../Components/my_tool_tip.dart';
import '../../../Providers/my_state.dart';

class NowExpressionView extends StatefulWidget {
  final String selectedValue;
  final String? type;
  final String param;
  final String factorTitle;
  const NowExpressionView(
      {required this.param,
      Key? key,
      this.type,
      required this.factorTitle,
      required this.selectedValue})
      : super(key: key);

  @override
  State<NowExpressionView> createState() => _NowExpressionViewState();
}

class _NowExpressionViewState extends State<NowExpressionView> {
  String emoji = "";
  String title = "";

  /// Date picker method
  Future<void> _showDatePicker(
      BuildContext context, MyState myStateProvider) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(200),
      onDatePickerModeChange: (value) {},
      lastDate: DateTime(3000),
    );

    if (pickedDate != null) {
      myStateProvider.selectedDate = pickedDate;
    }
  }

  /// Time Picker method
  TimeOfDay? selectedDateTime;
  String selectedTime = "";

  Future<void> getCurrentTime(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime.format(context);
      });
    }
  }

  Future<void> _showTimePicker(
      BuildContext context, MyState myStateProvider) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      myStateProvider.selectedTime = pickedTime;
    }
  }

  String _formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat.jm().format(dateTime);
  }

  MyState myState = MyState();
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
              'Add a New Question',
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
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Consumer<MyState>(
            builder: (context, myStateProvider, _) {
              return Consumer<MyState>(builder: (context, myStateProvider, _) {
                return Column(
                  children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      'Question 1',
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Container(
                        height: 240.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10.sp),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryColor,
                              blurRadius: 3,
                              spreadRadius: 2.0,
                              offset: const Offset(
                                  0, 3), // horizontal, vertical offset
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 15.h),
                          child: widget.selectedValue == 'Emoji'
                              ? SizedBox(
                                  height: 240.h,
                                  child: GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 40.w,
                                            mainAxisSpacing: 40.h),
                                    itemCount:
                                        5, // Total number of items in the grid
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final items =
                                          myState.emojisDataList[index];
                                      return EmojiContainer(
                                        emoji: items['emoji'].toString(),
                                        title: items['title'].toString(),
                                        textColor: items['textColor'] as Color,
                                        borderColor: myStateProvider
                                                    .selectedContainerIndex ==
                                                index
                                            ? Colors.red
                                            : Colors.white,
                                        onTap: () {
                                          emoji = items['emoji'].toString();
                                          title = items['title'].toString();
                                          myStateProvider
                                              .selectContainer(index);
                                        },
                                      );
                                    },
                                  ),
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 60.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10.sp)),
                                      child: Slider(
                                        activeColor: AppColors.white,
                                        value: myStateProvider.sliderValue,
                                        onChanged: (newValue) {
                                          myStateProvider.sliderValue =
                                              newValue;
                                        },
                                        min: 0,
                                        max: 100,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Text(
                                      'Expression: ${myStateProvider.sliderValue.toStringAsFixed(1)}',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                        )),
                    SizedBox(
                      height: 35.h,
                    ),
                    InkWell(
                      onTap: () {
                        _showDatePicker(context, myStateProvider);
                      },
                      child: Container(
                        height: 55.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(10.sp)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.date_range,
                                        size: 18.0,
                                        color: AppColors.white,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        myStateProvider.selectedDate != null
                                            ? myStateProvider.selectedDate
                                                .toString()
                                                .substring(0, 11)
                                            : "Select Date",
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Text(
                                "  Change",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    InkWell(
                      onTap: () {
                        _showTimePicker(context, myStateProvider);
                        //getCurrentTime(context);
                      },
                      child: Container(
                        height: 55.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(10.sp)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.access_time,
                                    size: 18.0,
                                    color: AppColors.white,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    myStateProvider.selectedTime != null
                                        ? _formatTime(
                                            myStateProvider.selectedTime!)
                                        : "Select Time",
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                ],
                              ),
                              Text(
                                "  Change",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                    YellowButton(
                        height: 50.h,
                        width: double.infinity,
                        title: 'Save',
                        onTap: () {
                          myStateProvider.saveNowParameterData(
                              context: context,
                              nowType: widget.type.toString(),
                              nowEmoji: emoji,
                              nowTitle: widget.selectedValue == 'Emoji'
                                  ? title
                                  : myStateProvider.sliderValue.toStringAsFixed(1),
                              nowParameter: widget.param,
                              nowFactorTitle: widget.factorTitle,
                              nowDate: myStateProvider.selectedDate.toString(),
                              nowTime: myStateProvider.selectedTime.toString());
                          myStateProvider.scheduleNotification(
                              title: '${widget.param } Notification',
                              body: 'Expression: ${widget.selectedValue == 'Emoji'
                                  ? title
                                  : '${myStateProvider.sliderValue
                                  .toStringAsFixed(1)}%'}');
                        })
                  ],
                );
              });
            },
          )),
    );
  }
}
