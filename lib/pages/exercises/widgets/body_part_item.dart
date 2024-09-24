import 'package:flutter/material.dart';

class BodyPartItem extends StatelessWidget {
  final String imageAsset;
  final String title;
  final void Function() onTap;

  const BodyPartItem({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            minRadius: 50,
            child: SizedBox(
              width: 50,
              height: 50,
              child: Image.asset(imageAsset),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
