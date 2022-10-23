import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResortWidget extends StatelessWidget {
  const ResortWidget({
    Key? key,
    required this.favourites,
    required this.beaches,
    required this.resortRatings,
    required this.ratings,
  }) : super(key: key);

  final RxList favourites;
  final List beaches;
  final RxList<double> resortRatings;
  final RxList<double> ratings;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(bottom: 14.h),
          height: 180.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              width: 1.h,
              color: const Color(
                0xffe5e5e5,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(
                  // "assets/images/goa.png",
                  beaches[index]['image'],
                ),
              ),
              SizedBox(
                width: 7.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 210.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          beaches[index]['title'],
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            favourites.contains(index)
                                ? favourites.remove(index)
                                : favourites.add(index);
                          },
                          child: Obx(
                            () => favourites.contains(index)
                                ? const Icon(Icons.favorite)
                                : const Icon(Icons.favorite_outline),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    beaches[index]["price"],
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: resortRatings[index],
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
                          resortRatings[index] = rating;
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
                              ),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Text(
                    "A resort is a place used for \nvacation, relaxation or as a day..",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff767676),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
