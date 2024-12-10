import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_color.dart';

class CustomDropDownItemBar extends StatelessWidget {
  final List<DropItemModel> dropItems;
  final String hintText;
  const CustomDropDownItemBar(
      {super.key, required this.dropItems, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          hintText,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        DropdownMenu(
          menuHeight: 200.h,
            menuStyle: MenuStyle(
                backgroundColor: const WidgetStatePropertyAll(AppColors.backGround),
                elevation: const WidgetStatePropertyAll(0),
                //maximumSize: WidgetStatePropertyAll(Size(double.infinity, 300.h)),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),

                ))),
            hintText: hintText,
            textStyle: TextStyle(color: AppColors.black, fontSize: 16.sp),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: AppColors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
              suffixIconColor: AppColors.textColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: BorderSide.none,
              ),
            ),
            dropdownMenuEntries: [
              ...List.generate(
                  dropItems.length,
                  (index) => DropdownMenuEntry(
                        style: ButtonStyle(
                          textStyle: WidgetStatePropertyAll(TextStyle(
                              color: AppColors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600)),
                        ),
                        label: dropItems[index].title,
                        value: dropItems[index].value,
                      )),
            ]),
      ],
    );
  }
}

class DropItemModel {
  final String title;
  final String value;
  DropItemModel({required this.title, required this.value});
}
