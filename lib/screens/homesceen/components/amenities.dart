import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/util/app_color.dart';
import 'package:hotel_app/widgets/small_text.dart';
import 'package:ionicons/ionicons.dart';

class Amenity {
  final IconData icon;
  final String label;

  Amenity({required this.icon, required this.label});
}

final List<Amenity> amenities = [
  Amenity(icon: Ionicons.restaurant, label: 'Restaurant'),
  Amenity(icon: Ionicons.fitness, label: 'Gym'),
  Amenity(icon: Ionicons.water, label: 'Large Pool'),
  Amenity(icon: Ionicons.car, label: 'Car Ride'),
  Amenity(icon: Ionicons.shirt, label: 'Laundry'),
  Amenity(icon: Ionicons.bed, label: 'In Room'),
];

Widget buildAmenitiesGrid(BuildContext context, String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmallText(
              text: title,
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => AllAmenitiesScreen(),
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
      GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 6.w,
          mainAxisSpacing: 6.h,
          childAspectRatio: 3 / 1.2,
        ),
        itemCount: amenities.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) =>
              //         AmenityDetailScreen(amenity: amenities[index]),
              //   ),
              // );
            },
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColor.greyColor3),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Icon(amenities[index].icon, size: 18.r),
                  Expanded(
                    child: SmallText(
                      align: TextAlign.center,
                      text: amenities[index].label,
                      overflow: TextOverflow.ellipsis,
                      size: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ],
  );
}

// Sample screen for amenity details
class AmenityDetailScreen extends StatelessWidget {
  final Amenity amenity;

  const AmenityDetailScreen({Key? key, required this.amenity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(amenity.label)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(amenity.icon, size: 100),
            SizedBox(height: 20.h),
            Text(
              amenity.label,
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

// Sample screen for all amenities
class AllAmenitiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Amenities')),
      body: ListView.builder(
        itemCount: amenities.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(amenities[index].icon),
            title: Text(amenities[index].label),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AmenityDetailScreen(amenity: amenities[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
