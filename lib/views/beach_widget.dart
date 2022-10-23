import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'beach_details.dart';

class BeachesWidget extends StatelessWidget {
  BeachesWidget({
    Key? key,
    required this.category,
    required this.categoryIndex,
    required this.beaches,
    required this.ratings,
  }) : super(key: key);

  final List category;
  final RxInt categoryIndex;
  final List beaches;
  final RxList<double> ratings;

  List favourites = [].obs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
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
                ),
                foregroundDecoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x00242424),
                      Color(0x002F2F2F),
                    ],
                  ),
                ),
                height: 246.h,
                width: 186.w,
                child: GestureDetector(
                  onTap: () {
                    Get.to(
                      BeachDetailsScreen(beaches[index]),
                    );
                  },
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.asset(
                          beaches[index]["image"],
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        bottom: 20.h,
                        left: 20.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              beaches[index]["title"],
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              children: [
                                Image.asset("assets/images/location.png"),
                                SizedBox(
                                  width: 7.w,
                                ),
                                Text(
                                  beaches[index]["location"],
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 7.w,
                            ),
                            Row(
                              children: [
                                RatingBar.builder(
                                  initialRating: ratings[index],
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 20.w,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    ratings[index] = rating;
                                  },
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Obx(
                                  (() => Text(
                                        ratings[index].toString(),
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 15.w,
                        top: 15.h,
                        child: GestureDetector(
                          onTap: () {
                            favourites.contains(index)
                                ? favourites.remove(index)
                                : favourites.add(index);
                          },
                          child: Container(
                            height: 36.h,
                            width: 36.h,
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Obx(
                              () => favourites.contains(index)
                                  ? Image.asset("assets/images/redheart.png")
                                  : const Icon(Icons.favorite_outline),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
