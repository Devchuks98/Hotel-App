import 'package:flutter/material.dart';
import 'package:hotel_app/screens/homesceen/components/rooms.dart';
import 'package:hotel_app/widgets/build_image_section.dart';
import 'package:hotel_app/widgets/height_spacer.dart';

import 'components/amenities.dart';
import 'components/build_service.dart';

class Home extends StatelessWidget {
  final String? firstName;

  Home({
    Key? key,
    this.firstName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageSectionWidget(
              backgroundImageAsset: 'assets/images/bg.png',
              title: 'Hi, $firstName👋🏽',
              subtitle: 'Your Paradise Awaits!',
              showAppBar: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  buildServiceSlider(),
                  const HeightSpacer(5),
                  buildAmenitiesGrid(context, 'Our Amenities'),
                  const HeightSpacer(5),
                  buildOurRooms(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
