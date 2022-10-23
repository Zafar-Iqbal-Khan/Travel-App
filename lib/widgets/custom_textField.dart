import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef OnPressedCallback = Function();

class CustomTextBox extends StatelessWidget {
  const CustomTextBox({
    Key? key,
    required this.width,
    required this.height,
    required this.radius,
    required this.hintText,
    required this.hasBorder,
  }) : super(key: key);

  final double width;
  final double height;
  final double radius;
  final String hintText;

  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(radius),
                    color: const Color(0xffE4E4E4),
                    border: hasBorder
                        ? Border.all(
                            width: 1,
                            color: const Color(0xffA9A9A9),
                          )
                        : null,
                  ),
                  width: width.w,
                  height: height.h,
                  padding: EdgeInsets.only(left: 17.w, right: 10.w),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    showCursor: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      counterText: "",
                      hintText: hintText,
                      hintStyle: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
