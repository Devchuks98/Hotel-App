import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/screens/bookings/components/review_avater.dart';
import 'package:hotel_app/screens/bookings/models/available_room.dart';
import 'package:hotel_app/util/app_color.dart';
import 'package:hotel_app/widgets/height_spacer.dart';
import 'package:hotel_app/widgets/small_text.dart';
import 'package:hotel_app/widgets/width_spacer.dart';

import '../../homesceen/components/amenities.dart';

class RoomDetailScreen extends StatelessWidget {
  final AvailableRoom room;

  const RoomDetailScreen({required this.room});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top image with AppBar overlay
            Stack(
              children: [
                Container(
                  height: 1.sh / 2.3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: AssetImage(room.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top,
                  left: 10.w,
                  child: IconButton(
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.greyColor3,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                        size: 18.r,
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SmallText(
                          text: room.title,
                          size: 19.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      RatingBar.builder(
                        initialRating: room.rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 15.sp,
                        unratedColor: Colors.grey,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          // Handle rating update
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      ReviewerAvatars(
                        imagePaths: const [
                          'assets/icons/avatar1.png',
                          'assets/images/frame.jpg',
                          'assets/icons/avatar2.png',
                          'assets/icons/avatar3.png',
                        ],
                      ),
                      const WidthSpacer(10),
                      const SmallText(
                        text: '99+ Reviewers',
                        color: AppColor.primaryColor,
                      )
                    ],
                  ),
                  const HeightSpacer(15),
                  const SmallText(
                    text:
                        'Indulge in the epitome of luxury and sophistication in our Presidential Suite, designed for guests seeking the ultimate in comfort and style. This expansive suite offers unparalleled elegance and exceptional amenities, ensuring an unforgettable stay.',
                  ),
                  buildAmenitiesGrid(context, 'Amenities'),
                  const HeightSpacer(50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(
                            text: 'Price',
                            size: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          const HeightSpacer(10),
                          SmallText(
                            text: room.price,
                            size: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor,
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle book now action
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.h, horizontal: 100.w),
                          backgroundColor: AppColor.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const SmallText(
                          text: 'Book Now',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget availableRooms(BuildContext context, List<AvailableRoom> rooms) {
  return Padding(
    padding: EdgeInsets.all(10.w),
    child: GridView.builder(
      itemCount: rooms.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20.h,
        crossAxisSpacing: 10.w,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    RoomDetailScreen(room: rooms[index]),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  var begin = const Offset(1.0, 0.0);
                  var end = Offset.zero;
                  var curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(rooms[index].image),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SmallText(
                          text: rooms[index].title,
                          color: Colors.white,
                          size: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RatingBar.builder(
                        initialRating: rooms[index].rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 10.sp,
                        unratedColor: Colors.white54,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          // Handle rating update
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  SmallText(
                    text: rooms[index].description,
                    color: Colors.white,
                    size: 13.sp,
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SmallText(
                      text: rooms[index].price,
                      color: Colors.white,
                      size: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
