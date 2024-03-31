import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthImage extends StatelessWidget {
  final String assetName;
  const AuthImage({
    super.key,
    required this.assetName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 240,
      child: SvgPicture.asset(assetName),
    );
  }
}
