import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:now_next/Components/custom_text_field.dart';
import 'package:now_next/Components/yellow_button.dart';
import 'package:now_next/Providers/my_state.dart';

import '../../../Components/emoji_container.dart';

class UpdateParameter extends StatefulWidget {
  const UpdateParameter({Key? key}) : super(key: key);

  @override
  State<UpdateParameter> createState() => _UpdateParameterState();
}

class _UpdateParameterState extends State<UpdateParameter> {


  MyState myState = MyState();


  // List<Map<String, dynamic>> dataList = [
  //   {
  //     'emoji': '\u{1F616}',
  //     'title': 'Bad',
  //     'textColor': const Color(0xffFF002E)
  //   },
  //   {'emoji': '\u{1F60C}', 'title': 'Ok', 'textColor': const Color(0xffFDE030)},
  //   {
  //     'emoji': '\u{1F60A}',
  //     'title': 'Good',
  //     'textColor': const Color(0xff6CFF12)
  //   },
  //   {
  //     'emoji': '\u{1F600}',
  //     'title': 'Great',
  //     'textColor': const Color(0xff12FF8D)
  //   },
  //   {
  //     'emoji': '\u{1F60D}',
  //     'title': 'Excellent',
  //     'textColor': const Color(0xff363535)
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add a New Question',
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
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h,),
            CustomTextField(
                height: 160.h,
                width: double.infinity,
                controller: myState.updateController,
                hintText: 'Type Here...',
                onChanged: (value){}
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 35.h,
            ),
            SizedBox(
              height: 240.h,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of columns in the grid
                  crossAxisSpacing: 40.w, // Spacing between columns
                  mainAxisSpacing: 40.h, // Spacing between rows
                ),
                itemCount: 5, // Total number of items in the grid
                itemBuilder: (BuildContext context, int index) {
                  final items = myState.emojisDataList[index];
                  // Function to build each item in the grid
                  return EmojiContainer(
                    emoji: items['emoji'].toString(),
                    title: items['title'].toString(),
                    textColor: items['textColor'] as Color,
                    onTap: () {}, borderColor: Colors.red,
                  );
                },
              ),
            ),
            SizedBox(
              height: 70.h,
            ),
            YellowButton(
                height: 50.h,
                width: double.infinity,
                title: 'Save',
                onTap: () {})
          ],
        ),
      ),
    );
  }
}
