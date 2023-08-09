import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final bool? divLine;
  final Color? textColor;

  const CustomDropdown({
    Key? key,
    required this.items,
    this.divLine,
    this.textColor,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String dropDownValue;

  @override
  void initState() {
    super.initState();
    dropDownValue = widget.items[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            underline: Container(),
            value: dropDownValue,
            onChanged: (String? newValue) {
              setState(() {
                dropDownValue = newValue!;
                print('New Value of Dropdown::::::::$newValue');
              });
            },
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.white,
              size: 25.sp,
            ),
            items: widget.items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: widget.divLine == true && dropDownValue != item
                    ? Text(
                  item,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                )
                    : Text(
                  item,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                    fontWeight: widget.textColor != null
                        ? FontWeight.w900
                        : null,
                  ),
                ),
              );
            }).toList(),

          ),
        ),
      ),
    );
  }
}

