import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/custom_textField.dart';
import '../widgets/header.dart';
import 'resort_widget.dart';
import 'beach_widget.dart';

class HomeScreen extends StatelessWidget {
  List category = [
    {"image": "assets/images/beach.png", "title": "Beach"},
    {"image": "assets/images/mountain.png", "title": "Mountain"},
  ];
  List beaches = [
    {
      "image": "assets/images/bali.png",
      "title": "Kuta Beach",
      "location": "Bali, Indonesia",
      "resort": "Kuta Resort",
      "price": "₹20,000",
      "resort_image": "assets/images/kuta.png"
    },
    {
      "image": "assets/images/goa.png",
      "title": "Baga Beach",
      "location": "Goa, India",
      "resort": "Baga Beach Resort",
      "price": "₹15,000",
      "resort_image": "assets/images/baga.png",
    },
  ];

  var categoryIndex = 0.obs;
  var ratings = [4.0, 3.0, 2.5].obs;
  var resortRatings = [4.0, 3.0, 2.5].obs;
  var favourites = [].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 33.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // physics: const BouncingScrollPhysics(),
              children: [
                const HeaderWidget(),
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  child: Text(
                    "Where do you \nwant to explore today?",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomTextBox(
                  width: 336.w,
                  height: 48,
                  hasBorder: false,
                  hintText: "Search",
                  radius: 10.r,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Choose Category",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 70,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: category.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          categoryIndex.value = index;
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 20.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: const Color(0xff5DC720),
                              width: 1.h,
                            ),
                          ),
                          height: 60.h,
                          width: 150.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(category[index]["image"]),
                              SizedBox(height: 10.w),
                              Text(
                                category[index]["title"],
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Obx(
                  () => categoryIndex == 0
                      ? BeachesWidget(
                          category: category,
                          categoryIndex: categoryIndex,
                          beaches: beaches,
                          ratings: ratings,
                        )
                      : Container(
                          height: 250,
                        ),
                ),
                SizedBox(
                  height: 44.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Popular Package",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xffE4E4E4),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                ResortWidget(
                  favourites: favourites,
                  beaches: beaches,
                  resortRatings: resortRatings,
                  ratings: ratings,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
