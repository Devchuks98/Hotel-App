import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_app/screens/bookings/bookings_page.dart';
import 'package:hotel_app/screens/checkIn_page.dart';
import 'package:hotel_app/screens/homesceen/home.dart';
import 'package:hotel_app/screens/profile/profile_screen.dart';
import 'package:hotel_app/util/app_color.dart';
import 'package:hotel_app/util/theme/theme_data_folder/theme_data.dart';
import 'package:hotel_app/util/theme/theme_data_folder/theme_data_provider.dart';
import 'package:hotel_app/widgets/small_text.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatefulWidget {
  final int currentPage;
  final String firstName;

  const LandingScreen({Key? key, this.currentPage = 0, required this.firstName})
      : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.currentPage);
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    pageProvider.addListener(_pageListener);
  }

  @override
  void dispose() {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    pageProvider.removeListener(_pageListener);
    _pageController.dispose();
    super.dispose();
  }

  void _pageListener() {
    if (_pageController.hasClients) {
      final pageProvider = Provider.of<PageProvider>(context, listen: false);
      _pageController.jumpToPage(
        pageProvider.currentPage,
      );
    }
  }

  Future<bool> _onWillPop() async {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    if (pageProvider.currentPage != 0) {
      pageProvider.updatePage(0);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          ThemeMode currentThemeMode = themeProvider.currentTheme;
          return Scaffold(
            backgroundColor: currentThemeMode == ThemeMode.light
                ? ThemingUtility.lightTheme.scaffoldBackgroundColor
                : ThemingUtility.darkTheme.scaffoldBackgroundColor,
            body: Consumer<PageProvider>(
              builder: (context, pageProvider, _) {
                return PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Home(
                      firstName: widget.firstName,
                    ),
                    const BookingsPage(),
                    const CheckInPage(),
                    ProfileScreen(
                      firstName: widget.firstName,
                    ),
                  ],
                );
              },
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
              onTap: (page) {
                Provider.of<PageProvider>(context, listen: false)
                    .updatePage(page);
              },
            ),
          );
        },
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color activeColor = AppColor.primaryColor;
    final Color inactiveColor = AppColor.greyColor4;
    final currentPage = Provider.of<PageProvider>(context).currentPage;

    return BottomAppBar(
      height: 70.h,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        height: 60.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(
              context,
              iconPath: "assets/svg/home.svg",
              label: "Home",
              isActive: currentPage == 0,
              onTap: () => onTap(0),
            ),
            _buildNavItem(
              context,
              iconPath: "assets/svg/booking.svg",
              label: "Bookings",
              isActive: currentPage == 1,
              onTap: () => onTap(1),
            ),
            _buildNavItem(
              context,
              iconPath: "assets/svg/check-in.svg",
              label: "Check In",
              isActive: currentPage == 2,
              onTap: () => onTap(2),
            ),
            _buildNavItem(
              context,
              iconPath: "assets/svg/profile.svg",
              label: "Profile",
              isActive: currentPage == 3,
              onTap: () => onTap(3),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context,
      {required String iconPath,
      required String label,
      required bool isActive,
      required VoidCallback onTap}) {
    const Color activeColor = AppColor.primaryColor;
    final Color inactiveColor = AppColor.greyColor6;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            color: isActive ? activeColor : inactiveColor,
            width: 20.w,
            height: 20.h,
          ),
          SmallText(
            text: label,
            color: isActive ? activeColor : inactiveColor,
            size: 12.sp,
          ),
        ],
      ),
    );
  }
}

class PageProvider with ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void updatePage(int page) {
    _currentPage = page;
    notifyListeners();
  }
}
