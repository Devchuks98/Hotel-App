import 'package:flutter/cupertino.dart';
import 'package:hotel_app/util/app_color.dart';

class ToogleView extends StatefulWidget {
  @override
  _ToogleViewState createState() => _ToogleViewState();
}

class _ToogleViewState extends State<ToogleView> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.7,
      child: CupertinoSwitch(
        activeColor: AppColor.secodaryColor,
        value: _switchValue,
        onChanged: (value) {
          setState(() {
            _switchValue = value;
          });
        },
      ),
    );
  }
}
