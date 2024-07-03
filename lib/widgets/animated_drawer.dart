import 'package:flutter/material.dart';

class CustomAnimatedDrawer extends StatefulWidget {
  final Widget child;
  final Widget drawerContent;

  const CustomAnimatedDrawer({
    Key? key,
    required this.child,
    required this.drawerContent,
  }) : super(key: key);

  @override
  CustomAnimatedDrawerState createState() => CustomAnimatedDrawerState();
}

class CustomAnimatedDrawerState extends State<CustomAnimatedDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      value: 0, // Start with drawer closed
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  void toggleDrawer() {
    if (_controller.isDismissed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  void closeDrawer() {
    _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        GestureDetector(
          onTap: closeDrawer,
          child: Container(
            color: Colors.transparent,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            double slide = 255.0 * _animation.value;
            double scale = 1.0 - (0.3 * _animation.value);
            return Transform(
              transform: Matrix4.identity()
                ..translate(slide)
                ..scale(scale),
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: toggleDrawer,
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: widget.drawerContent,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
