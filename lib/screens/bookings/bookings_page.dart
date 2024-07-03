import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/screens/bookings/components/room_tabview.dart';
import 'package:hotel_app/util/app_color.dart';
import 'package:hotel_app/widgets/build_image_section.dart';
import 'package:hotel_app/widgets/height_spacer.dart';
import 'package:hotel_app/widgets/small_text.dart';

import 'models/available_room.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({super.key});

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    // Use addPostFrameCallback to show the loading indicator after the first frame has been built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showLoadingIndicator();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _showLoadingIndicator() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pop(); // Dismiss the progress indicator
  }

  Widget _buildTab(String text, bool isSelected) {
    return SizedBox(
      width: 120.w, // Set fixed width
      height: 40.h, // Set fixed height
      child: Container(
        //  padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primaryColor : Colors.transparent,
          border: Border.all(color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: SmallText(
          text: text,
          color: isSelected ? Colors.white : AppColor.primaryColor,
          align: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ImageSectionWidget(
            backgroundImageAsset: 'assets/images/rm1.jpeg',
            title: 'Available Rooms',
            subtitle: 'Relax and Unwind in Your Perfect Hotel Room!',
            showAppBar: false,
          ),
          const HeightSpacer(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TabBar(
              isScrollable: false,
              controller: _tabController,
              labelColor: Colors.white,
              unselectedLabelColor: AppColor.primaryColor,
              indicator: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.transparent),
                ),
              ),
              tabs: [
                _buildTab('Suite', _tabController.index == 0),
                _buildTab('Deluxe Room', _tabController.index == 1),
                _buildTab('Standard Room', _tabController.index == 2),
              ],
              onTap: (index) {
                setState(() {
                  _tabController.index = index;
                });
              },
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                availableRooms(context, suites),
                availableRooms(context, deluxeRooms),
                availableRooms(context, standardRooms),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
