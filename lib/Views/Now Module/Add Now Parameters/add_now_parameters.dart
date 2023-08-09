import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:now_next/App%20Constants/App%20Colors/app_colors.dart';
import 'package:now_next/Components/custom_text_field.dart';
import 'package:now_next/Components/yellow_button.dart';
import 'package:now_next/Providers/my_state.dart';
import 'package:provider/provider.dart';

import '../../../App Constants/Constants/constants.dart';
import '../Now Exression View/now_expression_view.dart';

class AddNowParameters extends StatefulWidget {
  final String? type ;

  final String factorTitle;
  const AddNowParameters({Key? key, this.type, required this.factorTitle}) : super(key: key);

  @override
  State<AddNowParameters> createState() => _AddNowParametersState();
}

class _AddNowParametersState extends State<AddNowParameters> {

  MyState myState = MyState();
  String paramValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add New Questions',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: Icon(
          Icons.arrow_back,
          size: 20.sp,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Consumer<MyState>(
            builder: (context, myStateProvider, _) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                      height: 160.h,
                      width: double.infinity,
                      controller: myState.parameterController,
                      hintText: 'Enter a Question...',
                      onChanged: (value){
                        paramValue = value;
                        myState.changeParam(paramValue: value);
                      }
                  ),
                  SizedBox(height: 40.h,),
                  Text('Select Type of Review',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  Container(
                    width: double.infinity,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      color: Colors.blue, // Replace with your desired color
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Center(
                        child: DropdownButton<String>(
                          dropdownColor: Colors.grey,
                          alignment: Alignment.bottomCenter,
                          isExpanded: true,
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.white,
                            size: 25.sp,
                          ),
                          value: myStateProvider.selectedItem,
                          onChanged: (value) {
                            myStateProvider.selectedItem = value!;
                          },
                          items: Constants.dropDownItems.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: const TextStyle(
                                color: Colors.white,
                              ),),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 60.h,),
                  YellowButton(
                      height: 50.h,
                      width: double.infinity,
                      title: 'Next',
                      onTap: (){
                        Get.to(() =>  NowExpressionView(
                          selectedValue: myStateProvider.selectedItem,
                          factorTitle: widget.factorTitle.toString(),
                          type: widget.type,
                          param: paramValue,
                        )
                        );
                      })

                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
