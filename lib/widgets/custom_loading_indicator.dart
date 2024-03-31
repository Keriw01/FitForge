import 'package:fit_forge/styles/app_colors.dart';
import 'package:flutter/material.dart';

/// LoadingIndicator is a reusable widget that displays a centered CircularProgressIndicator.
class CustomLoadingIndicator extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double strokeWidth;
  const CustomLoadingIndicator({
    super.key,
    this.width = 100,
    this.height = 100,
    this.color = whiteColor,
    this.strokeWidth = 3,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: strokeWidth,
      ),
    );
  }
}
