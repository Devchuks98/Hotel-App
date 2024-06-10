// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:esteps/localization/locales.dart';
// import 'package:esteps/res/app_icons.dart';
// import 'package:esteps/screens/landing_screen.dart';
// import 'package:esteps/util/app_color.dart';
// import 'package:esteps/util/navigator/page_navigator.dart';
// import 'package:esteps/util/theme/theme_data_folder/theme_data.dart';
// import 'package:esteps/widgets/default_button.dart';
// import 'package:esteps/widgets/form_text.dart';
// import 'package:esteps/widgets/height_spacer.dart';
// import 'package:esteps/widgets/post_comment_tile.dart';
// import 'package:esteps/widgets/small_text.dart';
// import 'package:esteps/widgets/width_spacer.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_localization/flutter_localization.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:lottie/lottie.dart';

// class CustomDialogs {
//   static engageSheet(BuildContext context, ThemeMode currentThemeMode) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       enableDrag: true,
//       // showDragHandle: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20.r),
//           topRight: Radius.circular(20.r),
//         ),
//       ),
//       backgroundColor: AppColor.whiteColor,
//       builder: (context) {
//         final size = MediaQuery.of(context).size;
//         return Container(
//           height: 350.h,
//           width: size.width,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20.r),
//               topRight: Radius.circular(20.r),
//             ),
//             color: AppColor.whiteColor,
//           ),
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 HeightSpacer(20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: 8.h,
//                       width: 90.w,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10.r),
//                         color: AppColor.greyColor5,
//                       ),
//                     ),
//                   ],
//                 ),
//                 HeightSpacer(30),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Icon(
//                       Icons.cancel,
//                       color: AppColor.greyColor5,
//                       size: 29.h,
//                     )
//                   ],
//                 ),
//                 SmallText(
//                   text: LocaleData.engage_button.getString(context),
//                   size: 16.sp,
//                   fontWeight: FontWeight.w600,
//                 ),
//                 HeightSpacer(25),
//                 Row(
//                   children: [
//                     Image.asset(
//                       AppIcons.likeEmoji,
//                       height: 20.h,
//                       width: 20.w,
//                     ),
//                     WidthSpacer(5),
//                     DropdownButton(
//                       items: [],
//                       onChanged: (value) {},
//                       dropdownColor: AppColor.primaryColor,
//                       iconDisabledColor: AppColor.primaryColor,
//                     ),
//                   ],
//                 ),
//                 HeightSpacer(25),
//                 GestureDetector(
//                   onTap: () {
//                     commentSheet(context, currentThemeMode);
//                   },
//                   child: SmallText(
//                     text: "Comment",
//                     size: 16.sp,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 HeightSpacer(25),
//                 SmallText(
//                   text: "Copy Link",
//                   size: 16.sp,
//                   fontWeight: FontWeight.w600,
//                 ),
//                 HeightSpacer(25),
//                 SmallText(
//                   text: "Add to favourite",
//                   size: 16.sp,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   static commentSheet(BuildContext context, ThemeMode currentThemeMode) {
//     final size = MediaQuery.of(context).size;
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       enableDrag: true,
//       // showDragHandle: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20.r),
//           topRight: Radius.circular(20.r),
//         ),
//       ),
//       backgroundColor: AppColor.whiteColor,
//       builder: (context) {
//         return Container(
//           height: 400.h,
//           width: size.width,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20.r),
//               topRight: Radius.circular(20.r),
//             ),
//             color: AppColor.whiteColor,
//           ),
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 HeightSpacer(20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: 8.h,
//                       width: 90.w,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10.r),
//                         color: AppColor.greyColor5,
//                       ),
//                     ),
//                   ],
//                 ),
//                 HeightSpacer(30),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Icon(null),
//                     SmallText(
//                       text: "Comments",
//                       size: 16.sp,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     Icon(
//                       Icons.cancel,
//                       color: AppColor.greyColor5,
//                       size: 29.h,
//                     )
//                   ],
//                 ),
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: 3,
//                     itemBuilder: (BuildContext context, int index) {
//                       return PostCommentTile(
//                         currentThemeMode: currentThemeMode,
//                         commenterName: "Steve Joe",
//                         comment: 'This is unhygenic, people wey no wash hand',
//                       );
//                     },
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     CircleAvatar(),
//                     WidthSpacer(10.w),
//                     Expanded(
//                       child: FormText(
//                         hintStyle: TextStyle(
//                           color: AppColor.blackColor,
//                           fontSize: 14.sp,
//                           fontWeight: FontWeight.normal,
//                         ),
//                         borderRadius: 25.sp,
//                         textColor: currentThemeMode == ThemeMode.light
//                             ? AppColor.blackColor
//                             : AppColor.whiteColor,
//                         fillColor: currentThemeMode == ThemeMode.light
//                             ? AppColor.whiteColor
//                             : Colors.transparent,
//                         keyboardType: TextInputType.emailAddress,
//                         textInputAction: TextInputAction.done,
//                         hintText: 'Add a comment',
//                         contentPadding: EdgeInsets.only(left: 10.w),
//                         suffixIcon: IconButton(
//                           onPressed: () {},
//                           icon: SvgPicture.asset(
//                             AppIcons.sendIcon,
//                             height: 16.h,
//                             width: 16.w,
//                           ),
//                         ),
//                         // controller: _emailController,
//                       ),
//                     ),
//                   ],
//                 ),
//                 HeightSpacer(45),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   static bottomSheetContainer(
//       BuildContext context, ThemeMode currentThemeMode) {
//     return StatefulBuilder(
//       builder: (BuildContext context, StateSetter setState) {
//         return Container(
//           height: 500.h,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: currentThemeMode == ThemeMode.light
//                 ? ThemingUtility.lightTheme.scaffoldBackgroundColor
//                 : ThemingUtility.darkTheme.scaffoldBackgroundColor,
//             borderRadius: const BorderRadius.only(
//               topRight: Radius.circular(24),
//               topLeft: Radius.circular(24),
//             ),
//           ),
//           padding: const EdgeInsets.all(16),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Center(
//                   child: LottieBuilder.asset(
//                     "assets/animations/check_lottie.json",
//                     height: 203.h,
//                     width: 203.w,
//                   ),
//                 ),
//                 Center(
//                   child: Text(
//                     LocaleData.successful.getString(context),
//                     style: TextStyle(
//                         color: AppColor.secondaryColor,
//                         fontSize: 24.sp,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 Center(
//                   child: SmallText(
//                     text: LocaleData.post_success_message.getString(context),
//                     align: TextAlign.center,
//                     color: currentThemeMode == ThemeMode.light
//                         ? AppColor.blackColor
//                         : AppColor.greyColor3,
//                     size: 15.sp,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 HeightSpacer(50.h),
//                 Center(
//                   child: DefaultButton(
//                     onpressed: () {
//                       NavigationHelper.navigateAndClearStack(
//                           context, LandingScreen());
//                     },
//                     title: LocaleData.okay.getString(context),
//                     enabled: true,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   static fetchAndDisplayPost(BuildContext context) async {
//     // Fetch the post here
//     // Assuming you have the postId stored somewhere accessible
//     String postId = FirebaseAuth.instance.currentUser!.uid;

//     final firestore = FirebaseFirestore.instance;

//     try {
//       final docRef = firestore.collection('userPosts').doc(postId);
//       final snapshot = await docRef.get();
//       if (snapshot.exists) {
//         final postData = snapshot.data();
//         // Display the post on the home screen
//         // For now, let's print the post data
//         print('Fetched Post Data: $postData');
//       }
//     } catch (error) {
//       // Handle errors appropriately, e.g., show a snackbar or log the error
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error fetching post: $error'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   static feedBackSuccessSheet(ThemeMode currentThemeMode) {
//     return StatefulBuilder(
//       builder: (BuildContext context, StateSetter setState) {
//         return Container(
//           height: 500,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: currentThemeMode == ThemeMode.light
//                 ? ThemingUtility.lightTheme.scaffoldBackgroundColor
//                 : ThemingUtility.darkTheme.scaffoldBackgroundColor,
//             borderRadius: const BorderRadius.only(
//               topRight: Radius.circular(24),
//               topLeft: Radius.circular(24),
//             ),
//           ),
//           padding: const EdgeInsets.all(16),
//           child: SingleChildScrollView(
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: currentThemeMode == ThemeMode.light
//                       ? AppColor.greyColor1
//                       : AppColor.greyColor9,
//                 ),
//                 child: Icon(
//                   CupertinoIcons.xmark,
//                 ),
//               ),
//               Center(
//                 child: LottieBuilder.asset(
//                   "assets/animations/check_lottie.json",
//                   height: 203.h,
//                   width: 203.w,
//                 ),
//               ),
//               Center(
//                 child: Text(
//                   LocaleData.successful.getString(context),
//                   style: TextStyle(
//                       color: AppColor.secondaryColor,
//                       fontSize: 24.sp,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               Center(
//                 child: Text(
//                   LocaleData.messageSentSuccess.getString(context),
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       color: currentThemeMode == ThemeMode.light
//                           ? AppColor.blackColor
//                           : AppColor.greyColor3,
//                       fontSize: 15.sp,
//                       fontWeight: FontWeight.w500),
//                 ),
//               ),
//               HeightSpacer(30),
//               Center(
//                 child: DefaultButton(
//                   onpressed: () {
//                     NavigationHelper.navigateBack(
//                       context,
//                     );
//                     NavigationHelper.navigateBack(
//                       context,
//                     );
//                   },
//                   title: LocaleData.okay.getString(context),
//                   enabled: true,
//                 ),
//               ),
//             ]),
//           ),
//         );
//       },
//     );
//   }
// }
