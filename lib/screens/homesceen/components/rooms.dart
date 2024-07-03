import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/util/app_color.dart';
import 'package:hotel_app/widgets/small_text.dart';

class Room {
  final String image;
  final String title;
  final String description;
  final double rating;
  final String price;

  Room({
    required this.image,
    required this.title,
    required this.description,
    required this.rating,
    required this.price,
  });
}

final List<Room> rooms = [
  Room(
    image: 'assets/images/bg1.jpeg',
    title: 'Single Room',
    description: 'Cozy room for a single guest',
    rating: 4.5,
    price: 'N100,000',
  ),
  Room(
    image: 'assets/images/hot2.jpeg',
    title: 'Double Room',
    description: 'Spacious room for two guests',
    rating: 4.0,
    price: 'N150,000',
  ),
  Room(
    image: 'assets/images/hot3.jpeg',
    title: 'Suite',
    description: 'Luxurious suite with ocean view',
    rating: 5.0,
    price: 'N300,000',
  ),
];

Widget buildOurRooms(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmallText(
              text: 'Our Rooms',
              color: AppColor.blackColor,
              size: 18.sp,
              fontWeight: FontWeight.w600,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.zero,
              ),
              onPressed: () {
                // Handle navigation to all rooms
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => AllRoomsScreen(),
                //   ),
                // );
              },
              child: SmallText(
                text: 'See All',
                color: AppColor.primaryColor,
                size: 13.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 200.h, // Adjust height as needed
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: rooms.length,
          itemBuilder: (context, index) {
            return Container(
              width: 300.w,
              margin: EdgeInsets.only(right: 10.w),
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
                            size: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RatingBar.builder(
                          initialRating: rooms[index].rating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 16.sp,
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
                      size: 14.sp,
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SmallText(
                        text: rooms[index].price,
                        color: Colors.white,
                        size: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}

// Sample screen for all rooms
class AllRoomsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Rooms')),
      body: ListView.builder(
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading:
                Image.asset(rooms[index].image, width: 50.w, fit: BoxFit.cover),
            title: Text(rooms[index].title),
            subtitle: Text(rooms[index].description),
            trailing: SmallText(
              text: rooms[index].price,
              color: AppColor.blackColor,
              size: 14.sp,
              fontWeight: FontWeight.bold,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RoomDetailScreen(room: rooms[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Sample screen for room details
class RoomDetailScreen extends StatelessWidget {
  final Room room;

  const RoomDetailScreen({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(room.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(room.image, width: 200.w, fit: BoxFit.cover),
            SizedBox(height: 20.h),
            Text(
              room.title,
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            RatingBar.builder(
              initialRating: room.rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 20.sp,
              unratedColor: Colors.amber[100],
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                // Handle rating update
              },
            ),
            SizedBox(height: 10.h),
            Text(
              room.description,
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(height: 10.h),
            SmallText(
              text: room.price,
              color: AppColor.primaryColor,
              size: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
