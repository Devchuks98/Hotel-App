import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/screens/profile/components/build_button.dart';
import 'package:hotel_app/widgets/small_text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hotel_app/util/app_color.dart';
import 'package:hotel_app/widgets/height_spacer.dart';
import 'package:ionicons/ionicons.dart';

class ProfileScreen extends StatefulWidget {
  final String? firstName;

  const ProfileScreen({Key? key, this.firstName}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _profileImage = '';

  void _onCameraIconTap() async {
    final imageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      // Show loading indicator while uploading
      showDialog(
        context: context,
        barrierDismissible: false, // Prevent user from dismissing dialog
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      // Simulate image upload delay
      await Future.delayed(const Duration(seconds: 2));

      // Dismiss loading indicator
      Navigator.of(context).pop();

      setState(() {
        _profileImage = imageFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greyColor1.withOpacity(0.6),
      appBar: AppBar(
        backgroundColor: AppColor.greyColor1.withOpacity(0.6),
        title: SmallText(
          text: 'Profile Screen',
          size: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  HeightSpacer(10.h),
                  Center(
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: _onCameraIconTap,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey.shade200,
                            backgroundImage: _profileImage.isNotEmpty
                                ? FileImage(File(_profileImage))
                                : const AssetImage('assets/icons/user2.png')
                                    as ImageProvider,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: AppColor.primaryColor,
                            radius: 15.r,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 16.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const HeightSpacer(10),
                  SmallText(
                    text: '${widget.firstName}',
                    fontWeight: FontWeight.w600,
                    size: 18.sp,
                  ),
                  const HeightSpacer(5),
                  SmallText(
                    text: 'Awka, Anambra',
                    size: 14.sp,
                    color: AppColor.greyColor6,
                  ),
                  const HeightSpacer(50),
                  buildIconButton(
                    icon: Ionicons.person_outline,
                    title: 'Edit Profile',
                    onTap: () {},
                  ),
                  buildIconButton(
                    icon: Ionicons.lock_closed_outline,
                    title: 'Change password',
                    onTap: () {},
                  ),
                  buildIconButton(
                    icon: Ionicons.bookmark_outline,
                    title: 'Bookmark',
                    onTap: () {},
                  ),
                  buildIconButton(
                    icon: Ionicons.location_outline,
                    title: 'My Location',
                    onTap: () {},
                  ),
                  buildIconButton(
                    icon: Ionicons.settings_outline,
                    title: 'Settings',
                    onTap: () {},
                  ),
                  buildIconButton(
                    icon: Ionicons.exit_outline,
                    title: 'Logout',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
