import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_button_paint.dart';
import 'loading_indicator.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onTap,
      required this.isLoading,
      required this.actionTitle});
  final VoidCallback onTap;
  final String actionTitle;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: MediaQuery.sizeOf(context).width * 0.15709969788519637,
        width: MediaQuery.sizeOf(context).width,
        child: CustomPaint(
          size: Size(
              MediaQuery.sizeOf(context).width,
              (MediaQuery.sizeOf(context).width * 0.15709969788519637)
                  .toDouble()),
          painter: CustomButtonPaint(),
          child: isLoading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [const LoadingIndicator() ,SizedBox(width: 8.w,), Text(actionTitle)],
                )
              : Center(child: Text(actionTitle)),
        ),
      ),
    );
  }
}
