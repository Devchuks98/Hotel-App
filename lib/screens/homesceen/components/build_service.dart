import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/util/app_color.dart';
import 'package:hotel_app/widgets/small_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:async';

class Service {
  final String image;
  final String title;

  Service({required this.image, required this.title});
}

final List<Service> services = [
  Service(image: 'assets/images/slide1.jpeg', title: 'Luxury Spa'),
  Service(image: 'assets/images/hot1.jpeg', title: 'Gourmet Dining'),
  Service(
      image: 'assets/images/hot3.jpeg',
      title: "Get special offers when you book online"),
];

class buildServiceSlider extends StatefulWidget {
  @override
  _buildServiceSliderState createState() => _buildServiceSliderState();
}

class _buildServiceSliderState extends State<buildServiceSlider> {
  final PageController _pageController = PageController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = _pageController.page!.toInt() + 1;
        if (nextPage >= services.length) {
          nextPage = 0;
        }
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              height: constraints.maxWidth * 0.6, // Adjust height dynamically
              child: PageView.builder(
                controller: _pageController,
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 5, left: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(services[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmallText(
                            text: services[index].title,
                            color: Colors.white,
                            size: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 10.h),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Book Now'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                onPageChanged: (index) {
                  // Reset the timer when user manually changes the page
                  _timer?.cancel();
                  _startAutoSlide();
                },
              ),
            );
          },
        ),
        SizedBox(height: 10.h), // Adjust space between PageView and indicator
        SmoothPageIndicator(
          controller: _pageController,
          count: services.length,
          effect: WormEffect(
            dotHeight: 2.h,
            dotWidth: 15.w,
            activeDotColor: AppColor.primaryColor,
          ),
        ),
      ],
    );
  }
}
