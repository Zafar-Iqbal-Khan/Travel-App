import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  child: CircleAvatar(
                    radius: 16.r,
                    backgroundColor: const Color(0xffD9D9D9),
                  ),
                ),
                SizedBox(width: 10.w),
                Container(
                  child: Text(
                    "Hello, Zafar Iqbal",
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Image.asset("assets/images/lamp.png"),
            ),
          ],
        ),
      ),
    );
  }
}
