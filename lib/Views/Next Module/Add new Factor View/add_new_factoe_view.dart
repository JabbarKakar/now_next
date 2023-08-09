import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:now_next/Providers/my_state.dart';

import '../../../App Constants/Constants/constants.dart';
import '../../../Components/custom_text_field.dart';
import '../../../Components/my_tool_tip.dart';
import '../../../Components/yellow_button.dart';

class AddNewFactorView extends StatefulWidget {
  final String? type ;
   const AddNewFactorView({required this.type,Key? key}) : super(key: key);

  @override
  State<AddNewFactorView> createState() => _AddNewFactorViewState();
}

class _AddNewFactorViewState extends State<AddNewFactorView> {
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Icon(
              Icons.notifications_none_outlined,
              size: 20.sp,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
        child: Form(
          key: myState.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(
                  height: 135.h,
                  width: double.infinity,
                  controller: myState.factorController,
                  hintText: 'Enter your new factor',
                  onValidator: (value) {
                    return value.isEmpty ? "Field can't be empty" : null;
                  }),
              YellowButton(
                height: 50.h,
                width: double.infinity,
                title: 'Save',
                onTap: () {
                  if (myState.formKey.currentState!.validate()) {
                    myState.saveNextFactorData(type: widget.type.toString(), context: context);

                  }
                  //Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
