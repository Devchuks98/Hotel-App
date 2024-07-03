import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback? onHomePressed;
  final VoidCallback? onReservationsPressed;
  final VoidCallback? onBookingsPressed;
  final VoidCallback? onRoomsPressed;
  final VoidCallback? onProfilePressed;
  final VoidCallback? onSettingsPressed;
  final VoidCallback? onHelpAndSupportPressed;

  const CustomDrawer({
    Key? key,
    this.onHomePressed,
    this.onReservationsPressed,
    this.onBookingsPressed,
    this.onRoomsPressed,
    this.onProfilePressed,
    this.onSettingsPressed,
    this.onHelpAndSupportPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: const Text('Home'),
          onTap: onHomePressed,
        ),
        ListTile(
          title: const Text('Reservations'),
          onTap: onReservationsPressed,
        ),
        ListTile(
          title: const Text('Bookings'),
          onTap: onBookingsPressed,
        ),
        ListTile(
          title: const Text('Rooms'),
          onTap: onRoomsPressed,
        ),
        const Divider(),
        ListTile(
          title: const Text('Profile'),
          onTap: onProfilePressed,
        ),
        ListTile(
          title: const Text('Settings'),
          onTap: onSettingsPressed,
        ),
        ListTile(
          title: const Text('Help and Support'),
          onTap: onHelpAndSupportPressed,
        ),
      ],
    );
  }
}
